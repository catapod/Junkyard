# frozen_string_literal: true

module Api
  # Api controller for materials
  class MaterialsController < Api::ApiController
    before_action :set_material, only: %i[show update destroy]

    def index
      @materials = Material.all
      json_response @materials
    end

    def create
      @material = Material.new material_params
      @material.save!

      json_response @material, :created
    end

    def show
      json_response @material
    end

    def update
      @material.update material_params

      json_response @material
    end

    def destroy
      @material.destroy

      head :no_content
    end

    private

    def set_material
      @material = Material.find params[:id]
    end

    def material_params # rubocop:disable Metrics/MethodLength
      params.permit(
        :rightholder_id,
        :owner_id,
        :original_link,
        :caption_original,
        :caption_translated,
        :annotation_original,
        :annotation_translated,
        :state_id,
        :license_id,
        :original_language,
        :translation_language,
        :tags
      )
    end
  end
end
