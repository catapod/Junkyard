class Api::ChunksController < ApplicationController
  before_action :set_chunk, only: [:show, :update, :destroy]
  
  def index
    @chunks = Chunk.all
    json_response(@chunks)
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

    def material_params
      params.permit(
        :material_id,
        :material_position,
        :chunk_type_id,
        :translatable,
        :body
      )      
    end
end
