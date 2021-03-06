# encoding: UTF-8
ENV["RAILS_ENV"] = "test"
require 'simplecov'
SimpleCov.start
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  class Test::Unit::TestCase
    include FactoryGirl::Syntax::Methods
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end


