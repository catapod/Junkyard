# frozen_string_literal: true

# Api exceptions handler
module ExceptionHandler
  extend ActiveSupport::Concern

  def process_errors(e)
    title = e.message.split(':')[0].strip
    e.message.split(':')[1].split(',').map do |err|
      {
        title: title,
        detail: err.strip
      }
    end
  end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ errors: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      errors = process_errors e
      json_response({ errors: errors }, :unprocessable_entity)
    end
  end
end
