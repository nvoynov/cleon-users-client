require_relative 'service_port'

module UsersClient

  class SelectUsersPort < ServicePort
    port :get, '/users/'
  end

end
