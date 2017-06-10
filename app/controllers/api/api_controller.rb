class Api::ApiController < ApplicationController
  include Response
  include ExceptionHandler

  protect_from_forgery with: :null_session
end
