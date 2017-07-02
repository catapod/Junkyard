# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::ChunksController, type: :controller do
  let(:material) { create(:material) }
  let(:material_id) { material.id }

  describe 'GET api/materials/:material_id/chunks' do
    before { get :index, params: { material_id: material_id } }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'when there are chunks' do
      it 'returns chunks' do
        create_list(:chunk, 5, material: material)

        # call get once more to get chunks after initialization
        get :index, params: { material_id: material_id }

        expect(json).not_to be_empty
        expect(json.size).to eq(5)
        expect(response).to match_response_schema('chunks/index')
      end

      it 'returns chunks with full objects inside' do
        chunk = create(:chunk, material: material)
        create(:translation, chunk: chunk)
        create(:comment, chunk: chunk)

        get :index, params: { material_id: material_id }

        expect(response).to match_response_schema('chunks/index')
      end
    end
  end

  describe 'GET api/materials/:material_id/chunks/:id' do
    before { get :show, params: { material_id: material_id, id: chunk_id } }

    context 'when the record exists' do
      let(:chunk) { create(:chunk, material: material) }
      let(:chunk_id) { chunk.id }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the chunk' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(chunk_id)
        expect(response).to match_response_schema('chunks/show')
      end

      it 'returns the chunk with full objects' do
        chunk = create(:chunk, material: material)
        translation = create(:translation, chunk: chunk)
        create(:comment, chunk: chunk)
        create_list(:rate, 5, translation: translation)

        get :show, params: { material_id: material_id, id: chunk.id }

        expect(response).to match_response_schema('chunks/show')
      end
    end

    context 'when the record does not exist' do
      let(:chunk_id) { 200 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Chunk/)
      end
    end
  end

  describe 'POST api/materials/:material_id/chunks' do
    let(:chunk_type) { create(:chunk_type) }
    let :valid_attributes do
      {
        material_id: material_id,
        material_position: 1,
        chunk_type_id: chunk_type.id,
        translatable: true,
        body: 'Chuck Norris can solve the Towers of Hanoi in one move.'
      }
    end

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a chunk' do
        expect(json['body']).to eq('Chuck Norris can solve the Towers of Hanoi in one move.')
        expect(response).to match_response_schema('chunks/store')
      end
    end

    context 'when the request is invalid' do
      before { post :create, params: { body: 'test', translatable: true, material_id: material_id } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT api/materials/:material_id/chunks/:id' do
    context 'when the record exists' do
      let(:chunk) { create(:chunk, material: material) }
      let(:valid_attributes) do
        {
          material_id: material_id,
          id: chunk.id,
          body: 'Updated body'
        }
      end

      before { put :update, params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the record' do
        expect(json).not_to be_empty
        expect(json['body']).to eq('Updated body')
        expect(response).to match_response_schema('chunks/update')
      end
    end

    context 'when the record not exists' do
      before { put :update, params: { material_id: material_id, id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE api/materials/:material_id/chunks/:id' do
    context 'when material exists' do
      let(:chunk) { create(:chunk, material: material) }

      before { delete :destroy, params: { material_id: material_id, id: chunk.id } }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
    context 'when material exists' do
      before { delete :destroy, params: { material_id: material_id, id: 666 } }

      it 'returns statis code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
