require_relative '../test_helper'

describe ServicePort do 
  class PortStub < ServicePort
    port :get, '/users/session/register-user'
    
    def decorate(response)
      response
    end
  end

  describe '#call' do 
    it 'must call get' do 
      response = PortStub.()
      pp response
    end
  end

  describe '#new' do 
    let(:port) { PortStub }

    it 'must accept hash for body and params' do 
      port.new()
      port.new(body: {})
      port.new(body: {}, params: {})
      port.new(params: {})
    end

    it 'must fail for body and params other than hash' do 
      assert_raises(ArgumentError) { port.new(body: 1)}
      assert_raises(ArgumentError) { port.new(params: 1)}
      assert_raises(ArgumentError) { port.new(body: 1, params: 1)}
    end

  end
end