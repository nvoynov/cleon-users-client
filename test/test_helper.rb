# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "users_client"
require "minitest/autorun"
include UsersClient

UsersClient.base_uri = 'http://localhost:9292/api/v1'
