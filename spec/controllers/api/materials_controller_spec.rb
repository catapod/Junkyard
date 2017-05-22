require 'rails_helper'

RSpec.describe Api::MaterialsController, type: :controller do
  before(:all) do
    create_list(:user, 5)
    create_list(:state, 5)
    create_list(:rightholder, 5)
    create_list(:license, 5)
  end
  let!(:materials) { create_list(:material, 10) }
  let(:material_id) { materials.first.id }

  describe 'GET api/materials' do
    before { get :index }

    it 'returns materials' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET api/materials/:id' do
    before { get :show, params: { id: material_id } }

    context 'when the record exists' do
      it 'returns the material' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(material_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:material_id) { 200 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Material/)
      end
    end
  end

  describe 'POST api/materials' do
    let :valid_attributes do
      {
        id: material_id,
        rightholder_id: 1,
        owner_id: 2,
        state_id: 1,
        caption_original: 'Objects in Python',
        caption_translated: 'Объекты в Python',
        annotation_original: 'This lecture introduces Python',
        annotation_translated: 'В данной лекции вводятся понятия языка Python',
        license_id: 1,
        "original_language": "en",
        "translation_language": "ru",
        tags: [
          {
            name: 'course',
            display_name: 'курс',
            body: 'Electrical Engineering and Computer Science'
          },
          {
            name: 'course',
            display_name: 'курс',
            body: 'Electrical Engineering and Computer Science'
          }
        ]
      }
    end

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'creates a material' do
        expect(json['caption_original']).to eq('Objects in Python')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post :create, params: { caption_original: 'test', tags: [1] } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT api/materials/:id' do
    let(:valid_attributes) { { id: material_id, caption_original: 'Updated caption_original' } }

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

  describe 'DELETE api/materials/:id' do
    before { delete :destroy, params: { id: material_id } }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
