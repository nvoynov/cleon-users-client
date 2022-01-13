require_relative 'service_port'

module UsersClient

  class ChangeUserPasswordPort < ServicePort
    port :post, '/users/session/change-password'
  end

end
