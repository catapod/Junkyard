class Api::MaterialsController < Api::ApiController
  before_action :set_material, only: [:show, :update, :destroy]

  def index
    @materials = Material.all
    json_response @materials
  end

  def create
    @material = Material.new material_params
    unless tag_params['tags'].blank?
      tags = tag_params['tags'].map do |tag|
        if tag.size == 1 && tag.has_key?('id')
          MaterialTag.find tag['id']
        else
          MaterialTag.create! tag
        end
      end

      @material.tags << tags
    end
    @material.save!
    json_response @material, :created
  end

  def show
    json_response @material
  end

  def update
    unless tag_params['tags'].blank?
      @material.assign_attributes material_params

      tag_params['tags'].map do |tag|
        if tag.size == 1 && tag.has_key?('id')
          if @material.tags.find_by(id: tag['id']).blank?
            @material.tags << MaterialTag.find(tag['id'])
          end
        elsif tag.size > 1 && tag.has_key?('id')
          MaterialTag.find(tag['id']).update(tag.except!(:id))
        else
          @material.tags << MaterialTag.create!(tag)
        end
      end

      @material.save!
    else
      @material.update material_params
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

  def tag_params
    params.permit tags: [:id, :name, :display_name, :body]
  end
end
