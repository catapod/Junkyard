# frozen_string_literal: true
class Api::ChunksController < Api::ApiController
  before_action :set_chunk, only: [:show, :update, :destroy]

  def index
    @chunks = Material.find(params['material_id']).chunks.page params[:page]

    json_response("data": @chunks.map { |chunk| ChunkSerializer.new(chunk) })
  end

  def create
    @chunk = Chunk.create!(chunk_params)
    json_response(@chunk, :created)
  end

  def show
    json_response(@chunk)
  end

  def update
    @chunk.update(chunk_params)
    json_response(@chunk)
  end

  def destroy
    @chunk.destroy
    head :no_content
  end

  private

  def set_chunk
    @chunk = Chunk.find(params[:id])
  end

  def chunk_params
    params.permit(
      :material_id,
      :material_position,
      :chunk_type_id,
      :translatable,
      :body
    )
  end
end
