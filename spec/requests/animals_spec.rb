require 'rails_helper'

RSpec.describe Api::V1::AnimalsController, type: :request do

  describe "GET /index" do
    it "returns a success response" do
      get '/api/v1/animals'

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /show" do
    it "returns a success response" do
      animal = FactoryBot.create(:animal, name: 'Fluffy', species: 'Cat')

      get "/api/v1/animals/#{animal.id}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "returns a success response do" do
        post '/api/v1/animals', params: { name: 'Fido', species: 'Dog' }

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body)
        expect(json['status']).to eq('SUCCESS')
        expect(json['message']).to eq('Saved animal')
        expect(json['data']['name']).to eq('Fido')
        expect(json['data']['species']).to eq('Dog')
      end
    end

    context "with invalid parameters" do
      it "returns a unprocessable entity status" do
        post '/api/v1/animals', params: { name: '', species: '' }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /animals/:id' do
    it 'updates an animal with new data' do
      animal = FactoryBot.create(:animal, name: 'Fluffy', species: 'Dog')

      patch "/api/v1/animals/#{animal.id}", params: { name: 'Fido', species: 'Dog' }

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json['status']).to eq('SUCCESS')
      expect(json['message']).to eq('Updated animal')
      expect(json['data']['name']).to eq('Fido')
      expect(json['data']['species']).to eq('Dog')
    end
  end

  describe "DELETE /destroy" do
    it 'returns a success response' do
      animal = FactoryBot.create(:animal, name: 'Fluffy', species: 'Cat')

      delete "/api/v1/animals/#{animal.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end

