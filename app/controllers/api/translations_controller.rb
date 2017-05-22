class Api::TranslationsController < Api::ApiController
  before_action :set_translation, only: [:show, :update, :destroy]

  def index
    @translations = Translation.all
    json_response(@translations)
  end

  def create
    @translation = Translation.create!(translation_params)
    json_response(@translation, :created)
  end

  def show
    json_response(@translation)
  end

  def update
    @translation.update(translation_params)
    json_response(@translation)
  end

  def destroy
    @translation.destroy
    head :no_content
  end

  private

  def set_translation
    @translation = Translation.find(params[:id])
  end

  def translation_params
    params.permit(
      :translator_id,
      :body
    )
  end
end
