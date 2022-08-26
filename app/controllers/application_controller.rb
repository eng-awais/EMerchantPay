# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include ExceptionHandler

  before_action :authenticate_user!
end
