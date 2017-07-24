# frozen_string_literal: true
module Api
  # Translation rates controller
  class RatesController < Api::ApiController
    before_action :set_rate

    def rate
      if @rate.nil?
        @rate = Rate.create!(rate_params)
      else
        @rate.value = params[:value]
        @rate.save!
      end

      json_response @rate
    end

    private

    def set_rate
      @rate = Rate.find_by params.permit(
        :rater_id,
        :translation_id
      ).to_h
    end

    def rate_params
      params.permit(
        :rater_id,
        :translation_id,
        :value
      )
    end
  end
end
