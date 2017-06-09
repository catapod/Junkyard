# frozen_string_literal: true
class Api::MaterialsController < Api::ApiController
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

  def material_params
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
    unless permitted_tags['tags'].blank?
      permitted_tags['tags'].map do |tag|
        tag = tag.to_h
        if tag.size == 1 && tag.key?('id')
          if @material.tags.find_by(id: tag['id']).blank?
            @material.tags << MaterialTag.find(tag['id'])
          end
        elsif tag.size > 1 && tag.key?('id')
          MaterialTag.find(tag['id']).update(tag.except!(:id))
        else
          @material.tags << MaterialTag.create!(tag)
        end
      end
    end
  end
end
