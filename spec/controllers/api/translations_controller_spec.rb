# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::TranslationsController, type: :controller do
  let!(:material) { create(:material) }
  let(:chunk) { create(:chunk, material: material) }
  let(:route_params) { { material_id: material.id, chunk_id: chunk.id } }

  describe 'GET api/materials/:material_id/chunks/:chunk_id/translations' do
    before { get :index, params: route_params }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'when the chunk has no translations' do
      it 'returns empty response' do
        expect(json['data']).to be_empty
      end
    end

    context 'when the chunk has translations' do
      it 'returns translations' do
        create_list(:translation, 5, chunk: chunk)

        get :index, params: route_params

        expect(json).not_to be_empty
        expect(json['data'].size).to eq(5)
        expect(response).to match_response_schema('chunks/translations/index')
      end
    end
  end

  describe 'GET api/materials/:material_id/chunks/:chunk_id/translations/:id' do
    context 'when the translation does not exist' do
      before { get :show, params: { **route_params, id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Translation/)
      end
    end

    context 'when the translation exists' do
      let(:translation) { create(:translation, chunk: chunk) }

      before { get :show, params: { **route_params, id: translation.id } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the translation' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(translation.id)
        expect(response).to match_response_schema('chunks/translations/show')
      end

      it 'returns the translation with full objects' do
        create_list(:rate, 5, translation: translation)
        expect(response).to match_response_schema('chunks/translations/show')
      end
    end
  end

  describe 'POST api/materials/:material_id/chunks/:chunk_id/translations' do
    let(:translator) { create(:user) }
    let :valid_attributes do
      {
        **route_params,
        translator_id: translator.id,
        body: 'Chuck Norris can solve the Towers of Hanoi in one move.'
      }
    end

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a translation' do
        expect(json['body']).to eq('Chuck Norris can solve the Towers of Hanoi in one move.')
        expect(response).to match_response_schema('chunks/translations/store')
      end
    end

    context 'when the request is invalid' do
      before { post :create, params: valid_attributes.except(:body) }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT api/materials/:material_id/chunks/:chunk_id/translations/:id' do
    let(:translation) { create(:translation, chunk: chunk) }
    let(:valid_attributes) do
      {
        **route_params,
        id: translation.id,
        body: 'Updated body'
      }
    end

    context 'when the translation exists' do
      before { put :update, params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the translation' do
        expect(json).not_to be_empty
        expect(json['body']).to eq('Updated body')
        expect(response).to match_response_schema('chunks/translations/update')
      end
    end

    context 'when the translation does not exists' do
      before { put :update, params: { **route_params, id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE api/materials/:material_id/chunks/:chunk_id/translations/:id' do
    context 'when the translation exists' do
      let(:translation) { create(:translation, chunk: chunk) }
      before { delete :destroy, params: { **route_params, id: translation.id } }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the translation does not exists' do
      before { put :update, params: { **route_params, id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
