# frozen_string_literal: true
module Api
  # Translation rates controller
  class RatesController < Api::ApiController
    def rate
      @rate = Rate.find_or_create_by!(rate_params)

      json_response(@rate)
    end

    private

    def rate_params
      params.permit(
        :rater_id,
        :translation_id,
        :value
      )
    end
  end
end
