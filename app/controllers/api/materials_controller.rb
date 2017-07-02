# frozen_string_literal: true
module Api
  # Api controller for materials
  class MaterialsController < Api::ApiController
    before_action :set_material, only: [:show, :update, :destroy]

    def index
      @materials = Material.all
      json_response @materials
    end

    def create
      @material = Material.new material_params
      process_tags
      @material.save!
      json_response @material, :created
    end

    def show
      json_response @material
    end

    def update
      if permitted_tags['tags'].blank?
        @material.update material_params
      else
        @material.assign_attributes material_params
        process_tags
        @material.save!
      end
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
        :translation_language
      )
    end

    def permitted_tags
      params.permit tags: [:id, :name, :display_name, :body]
    end

    def process_tags
      return if permitted_tags['tags'].blank?

      permitted_tags['tags'].map { |tag| handle_tag(tag.to_h) }
    end

    def handle_tag(tag)
      return attach_tag_by_id(tag['id']) if tag.size == 1 && tag.key?('id')

      return update_tag(tag) if tag.size > 1 && tag.key?('id')

      create_tag(tag)
    end

    def attach_tag_by_id(id)
      return unless @material.tags.find_by(id: id).blank?

      @material.tags << MaterialTag.find(id)
    end

    def create_tag(tag)
      @material.tags << MaterialTag.create!(tag)
    end

    def update_tag(tag)
      MaterialTag.find(tag['id']).update(tag.except!(:id))
    end
  end
end
