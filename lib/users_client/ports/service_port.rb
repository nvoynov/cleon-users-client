require 'typhoeus'
require 'json'
require 'forwardable'
require_relative '../../users_client'

module UsersClient

  # The basic class for HTTP port of domain service
  class ServicePort 
    extend Forwardable
      def_delegator :UsersClient, :base_uri
    # class methods
    class << self
      attr_accessor :method
      attr_accessor :uri

      def port(method, uri)
        raise ArgumentError.new("Unknown method #{method}"
        ) unless method?(method)

        raise ArgumentError.new("Wrong URI '#{uri}'"
        ) unless uri.is_a?(String) && !uri.empty?

        @method = method
        @uri = uri
      end

      def method?(method)
        METHODS.include?(method)
      end

      def call(*args, **kwargs)
        new(*args, **kwargs).call
      end
    end

    # port's initializer params are identical to service
    # def initialize(para1, para2 = nil, key1:, key2: nil)
    #   @parameters = hash_arguments(__method__, binding)
    # end

    def initialize(body: nil, params: nil)
      raise ArgumentError.new(':body must be a Hash') if body && !body.is_a?(Hash)
      raise ArgumentError.new(':params must be a Hash') if params && !params.is_a?(Hash)
      @body = body 
      @params = params
    end

    # @return [JSON] the request JSON body
    def body       
      return '' unless @body
      JSON.generate(@body.transform_keys(&:to_s)) 
    end

    # @return [Hash] the request url parameters with string keys
    def params       
      return {} unless @params      
      @params.transform_keys(&:to_s)
    end
    
    # @return [Typhoeus::Request]
    def request
      options = {method: method}
      options[:headers] = {'Content-Type'=> "application/json"}
      options[:body] = body if body
      options[:params] = params if params
      Typhoeus::Request.new(uri, options)
    end

    def call
      response = request.run      
      raise response.body unless response.code == 200
      decorate(response.body)
    end

    def decorate(response)
      JSON.parse(response)
    end

    # @return [Hash] with all method arguments name=value
    # def hash_arguments(meth, abinding)
    #   method(meth).parameters.each_with_object({}) do |(spec, name), memo|
    #     value = abinding.local_variable_get(name)
    #     memo[name.to_s] = value if value
    #   end
    # end

    def method
      self.class.method
    end

    def uri
      base_uri + self.class.uri
    end

    METHODS = [:get, :post, :put, :patch, :head, :delete, :options]

  end
end 