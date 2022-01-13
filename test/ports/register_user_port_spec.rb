require_relative '../test_helper'

describe RegisterUserPort do

  describe '#call' do
    let(:mail) { Time.now.strftime('%H%M%S') + 'c@c.com'}
    let(:user) {
      {'name' => 'user', 'email' => mail, 'password' => 'pa$$w0rd'}
    }

    it 'must return user' do
      response = RegisterUserPort.(body: user)
      assert response
      assert response['data']
      assert response['data']['email']
      assert_equal mail, response['data']['email']

      assert_raises(RuntimeError) { RegisterUserPort.(body: user) }
    end

  end

end
