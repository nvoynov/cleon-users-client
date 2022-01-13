require_relative 'service_port'

module UsersClient

  class AuthenticateUserPort < ServicePort
    port :post, '/users/session/authenticate'
  end

end
