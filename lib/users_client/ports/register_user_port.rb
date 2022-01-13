require_relative 'service_port'

module UsersClient

  class RegisterUserPort < ServicePort 
    port :post, '/users/session/register-user'
  end

end 