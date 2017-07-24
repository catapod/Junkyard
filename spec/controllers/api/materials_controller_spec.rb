# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MaterialsController, type: :controller do
  describe 'GET api/materials' do
    before { get :index }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'when there are no materials' do
      it 'returns empty response' do
        expect(json).to be_empty
      end
    end

    context 'when there are materials' do
      it 'returns them' do
        create_list(:material, 5)

        # call get once more to get materials after initialization
        get :index

        expect(json).not_to be_empty
        expect(json.size).to eq(5)
      end
    end
  end

  describe 'GET api/materials/:id' do
    context 'when the material exists' do
      let(:material) { create(:material) }

      before { get :show, params: { id: material.id } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the material' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(material.id)
      end
    end

    context 'when the material does not exist' do
      before { get :show, params: { id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Material/)
      end
    end
  end

  describe 'POST api/materials' do
    let(:owner) { create(:user) }
    let(:rightholder) { create(:rightholder) }
    let(:state) { create(:state) }
    let(:license) { create(:license) }
    let(:tags) { create_list(:material_tag, 2) }

    let :valid_attributes do
      {
        rightholder_id: rightholder.id,
        owner_id: owner.id,
        state_id: state.id,
        caption_original: 'Objects in Python',
        caption_translated: 'Объекты в Python',
        annotation_original: 'This lecture introduces Python',
        annotation_translated: 'В данной лекции вводятся понятия языка Python',
        license_id: license.id,
        "original_language": 'en',
        "translation_language": 'ru',
        tags: tags.map(&:id)
      }
    end

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a material' do
        expect(json['caption_original']).to eq('Objects in Python')
      end
    end

    context 'when the request is invalid' do
      before { post :create, params: { caption_original: 'test' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end

    context 'when the tags is not exists' do
      before { post :create, params: { **valid_attributes, tags: [200] } }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns not found message' do
        expect(json['tags']).not_to include(200)
      end
    end
  end

  describe 'PUT api/materials/:id' do
    let(:material) { create(:material) }
    let(:valid_attributes) { { caption_original: 'Updated caption_original' } }

    context 'when the material exists' do
      before { put :update, params: { **valid_attributes, id: material.id } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the record' do
        expect(json).not_to be_empty
        expect(json['caption_original']).to eq('Updated caption_original')
      end
    end

    context 'when the material exists' do
      before { put :update, params: { **valid_attributes, id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE api/materials/:id' do
    before { delete :destroy, params: { id: material_id } }

    context 'when the material exists' do
      let(:material) { create(:material) }
      let(:material_id) { material.id }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the material does not exists' do
      let(:material_id) { 999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
