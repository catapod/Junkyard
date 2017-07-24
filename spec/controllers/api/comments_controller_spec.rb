# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do
  let(:material) { create(:material) }
  let(:chunk) { create(:chunk, material: material) }
  let(:route_params) { { material_id: material.id, chunk_id: chunk.id } }

  describe 'GET api/materials/:material_id/chunks/:chunk_id/comments' do
    before { get :index, params: route_params }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'when the chunk has no comments' do
      it 'returns empty response' do
        expect(json['data']).to be_empty
      end
    end

    context 'when the chunk has comments' do
      it 'returns them' do
        create_list(:comment, 5, chunk: chunk)

        get :index, params: route_params

        expect(json).not_to be_empty
        expect(json['data'].size).to eq(5)
        expect(response).to match_response_schema('chunks/comments/index')
      end
    end
  end

  describe 'GET api/materials/:material_id/chunks/:chunk_id/comments/:id' do
    context 'when the comment exists' do
      let(:comment) { create(:comment, chunk: chunk) }

      before { get :show, params: { **route_params, id: comment.id } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the comment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(comment.id)
        expect(response).to match_response_schema('chunks/comments/show')
      end
    end

    context 'when the comment does not exist' do
      before { get :show, params: { **route_params, id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'POST api/materials/:material_id/chunks/:chunk_id/comments' do
    let(:commentator) { create(:user) }
    let :valid_attributes do
      {
        **route_params,
        commentator_id: commentator.id,
        body: 'Chuck Norris can solve the Towers of Hanoi in one move.'
      }
    end

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a comment' do
        expect(json['body']).to eq('Chuck Norris can solve the Towers of Hanoi in one move.')
        expect(response).to match_response_schema('chunks/comments/store')
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

  describe 'PUT api/materials/:material_id/chunks/:chunk_id/comments/:id' do
    let(:comment) { create(:comment) }
    let(:valid_attributes) do
      {
        **route_params,
        id: comment.id,
        body: 'Updated body'
      }
    end

    context 'when the comment exists' do
      let(:comment) { create(:comment, chunk: chunk) }

      before { put :update, params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the comment' do
        expect(json).not_to be_empty
        expect(json['body']).to eq('Updated body')
        expect(response).to match_response_schema('chunks/comments/update')
      end
    end

    context 'when the comment does not exist' do
      before { put :update, params: { **valid_attributes, id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE api/materials/:material_id/chunks/:chunk_id/comments/:id' do
    context 'when the comment exists' do
      let(:comment) { create(:comment, chunk: chunk) }

      before { delete :destroy, params: { **route_params, id: comment.id } }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the comment does not exists' do
      before { put :update, params: { **route_params, id: 666 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
