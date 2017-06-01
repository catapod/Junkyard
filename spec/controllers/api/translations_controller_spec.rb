require 'rails_helper'

RSpec.describe Api::TranslationsController, type: :controller do
  before(:all) do
    create_list(:user, 5)
    create_list(:rightholder, 5)
    create_list(:license, 5)
  end

  let!(:materials) { create_list(:material_with_chunks, 10) }
  let(:material_id) { materials.first.id }
  let(:chunk_id) { materials.first.chunks.first.id }
  let(:translation_id) { materials.first.chunks.first.translations.first.id }
  let(:translation_params) { { material_id: material_id, chunk_id: chunk_id, id: translation_id } }

  describe 'GET api/materials/:material_id/chunks/:chunk_id/translations' do
    before { get :index, params: translation_params.except!(:id) }

    it 'returns translations' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET api/materials/:material_id/chunks/:chunk_id/translations/:id' do
    before { get :show, params: translation_params }

    context 'when the record exists' do
      it 'returns the translation' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(translation_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:translation_id) { 200 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Translation/)
      end
    end
  end

  describe 'POST api/materials/:material_id/chunks/:chunk_id/translations' do
    let :valid_attributes do
      {
        **translation_params.except!(:id),
        translator_id: 1,
        body: 'Chuck Norris can solve the Towers of Hanoi in one move.'
      }
    end

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'creates a translation' do
        expect(json['body']).to eq('Chuck Norris can solve the Towers of Hanoi in one move.')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post :create, params: { body: 'test', **translation_params.except!(:id) } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT api/materials/:material_id/chunks/:chunk_id/translations/:id' do
    let(:valid_attributes) { { **translation_params, body: 'Updated body' } }

    context 'when the record exists' do
      before { put :update, params: valid_attributes }

      it 'updated the record' do
        expect(json).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE api/materials/:material_id/chunks/:chunk_id/translations/:id' do
    before { delete :destroy, params: translation_params }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
