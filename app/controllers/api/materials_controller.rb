class Api::MaterialsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

    def material_params
      params.permit(
        :original_link,
        :caption_original,
        :caption_translated,
        :annotation_original,
        :annotation_translated,
        :original_language,
        :translation_language,
        :tags
      )      
    end
end
