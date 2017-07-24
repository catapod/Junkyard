# frozen_string_literal: true

module Api
  # Base Api controller
  class ApiController < ApplicationController
    include Response
    include ExceptionHandler

    protect_from_forgery with: :null_session
  end
end
