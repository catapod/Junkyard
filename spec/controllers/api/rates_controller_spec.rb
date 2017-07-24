# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::RatesController, type: :controller do
  let!(:material) { create(:material) }
  let(:chunk) { create(:chunk, material: material) }
  let(:translation) { create(:translation, chunk: chunk) }
  let(:rater) { create(:user) }
  let(:route_params) do
    {
      material_id: material.id,
      chunk_id: chunk.id,
      translation_id: translation.id
    }
  end

  describe 'PUT api/materials/:material_id/chunks/:chunk_id/translations/:translation_id/rate' do
    context 'when rater already has rate the translation' do
      before { put :rate, params: { **route_params, value: 1, rater_id: rater.id } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updats existed rate with different value' do
        prev_rate = json

        put :rate, params: { **route_params, value: -1, rater_id: rater.id }

        expect(json['id']).to eq(prev_rate['id'])
        expect(json['updated_at']).to be > prev_rate['updated_at']
        expect(json.except('updated_at', 'value')).to eq(prev_rate.except('updated_at', 'value'))
      end

      it 'does not updates existed rate with same value' do
        prev_rate = json

        put :rate, params: { **route_params, value: 1, rater_id: rater.id }

        expect(json).to eq(prev_rate)
      end
    end

    context 'when rater rates up' do
      before { put :rate, params: { **route_params, value: 1, rater_id: rater.id } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns proper rate object' do
        expect(response).to match_response_schema('chunks/translations/rates/rate')
      end
    end

    context 'when rater rates down' do
      before { put :rate, params: { **route_params, value: -1, rater_id: rater.id } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns proper rate object' do
        expect(response).to match_response_schema('chunks/translations/rates/rate')
      end
    end
  end
end
