require_relative '../test_helper'

describe SelectUsersPort do

  before do
    1.upto(10) do |index|
      RegisterUserPort.(body: {
        'name' => 'user', 'email' => "a#{index}@c.c", 'password' => 'pa$$w0rd'
      })
    end
  end

  describe '#call' do

    it 'must return users' do
      response = SelectUsersPort.(params: {'limit' => '5', 'offset' => '1'})
      pp response
      # assert response
      # assert response['data']
      # assert response['data']['email']
      # assert_equal mail, response['data']['email']
      #
      # assert_raises(RuntimeError) { RegisterUserPort.(body: user) }
    end

  end

end
