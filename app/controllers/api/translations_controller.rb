class Api::TranslationsController < Api::ApiController
  before_action :set_translation, only: [:show, :update, :destroy]

  def index
    @translations = Chunk.find(params['chunk_id']).translations.page params[:page]

    json_response("data": @translations.map { |translation| TranslationSerializer.new(translation) })
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
      :chunk_id,
      :body
    )
  end
end
