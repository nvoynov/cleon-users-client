# frozen_string_literal: true

require_relative "users_client/version"
require_relative "users_client/ports"

module UsersClient
  class Error < StandardError; end
  
  class << self
    attr_reader :base_uri
    
    def base_uri=(uri)
      @base_uri = uri 
    end

    def register_user(name:, email:, password:)
      # TODO: guard arguments to prevent wrong error calls
      RegisterUserPort.(args_hash(__method__, binding))
    end
    
    def authenticate_user(email:, password:)
      # TODO: guard arguments to prevent wrong error calls
      AuthenticateUserPort.(args_hash(__method__, binding))
    end
    
    def change_user_password(email:, old_password:, new_password:)
      # TODO: guard arguments to prevent wrong error calls
      ChangeUserPasswordPort.(args_hash(__method__, binding))
    end
    
    def select_users(query: nil, order_by: nil, limit: nil, offset: nil)
      # TODO: guard arguments to prevent wrong error calls
      SelectUsersPort.(args_hash(__method__, binding))
    end

    def hash_args(meth, abinding)
      method(meth).parameters.each_with_object({}) do |(spec, name), memo|
        value = abinding.local_variable_get(name)
        memo[name] = value if value
      end
    end

  end

end
