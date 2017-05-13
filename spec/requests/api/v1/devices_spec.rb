require 'rails_helper'

describe 'Devices API', type: :request do
  describe 'GET /api/v1/devices' do

    context 'GET /devices' do
      before(:each) do
        @devices = FactoryGirl.create_list(:device, 5)
        get '/api/v1/devices'
        @json = JSON.parse(response.body)["data"]
      end

      it 'returns a 200 status code' do
        expect(response).to be_success
      end

      it 'returns all devices' do
        expect(@json.length).to eq(5)
      end
    end

    context 'GET /devices/:id' do
      context "when record exist" do
        before(:each) do
          @device = FactoryGirl.create(:device)
          get "/api/v1/devices/#{@device.id}"
          @json = JSON.parse(response.body)["data"]
        end

        it "returns the device" do
          expect(@json["id"].to_i).to eq @device.id
        end

        it "returns a 200 status code" do
          expect(response).to be_success
        end
      end

      context "when record doesn't exist" do
      end
    end

    context 'POST /devices' do
      context 'when request is valid' do
        before(:each) do
          @attributes = FactoryGirl.attributes_for(:device)
          headers = { "CONTENT_TYPE": "application/vnd.api+json" }
          params = {
            "data": {
              "type": "devices",
              "attributes": @attributes
            }
          }

          post '/api/v1/devices', params: params.to_json, headers: headers

          @json = JSON.parse(response.body)["data"]
        end

        it 'creates a device' do
          expect(@json["attributes"]["device_mac"]).to eq @attributes[:device_mac]
        end

        it 'returns a 201 status code' do
          expect(response.code).to eq "201"
        end
      end

      context 'when request is invalid' do
        before(:each) do
          @attributes = {some_field: "some value"}
          headers = { "CONTENT_TYPE": "application/vnd.api+json" }
          params = {
            "data": {
              "type": "devices",
              "attributes": @attributes
            }
          }

          post '/api/v1/devices', params: params.to_json, headers: headers

          @json = JSON.parse(response.body)["errors"]
        end

        it 'returns a status code 400' do
          expect(response.code).to eq "400"
        end

        it 'returns an error message of param not allowed' do
          expect(@json.any? { |error| error[:title] = "Param not allowed" }).to be true
        end
      end
    end

    context 'PUT /devices/:id' do
      context 'when record exist' do
        before(:each ) do
          headers = { "CONTENT_TYPE": "application/vnd.api+json" }
          @device = FactoryGirl.create(:device)
          @attribute = { name: '1234ED'}
          params = {
            "data": {
              "id": "#{@device.id}",
              "type": "devices",
              "attributes": @attribute
            }
          }

          put "/api/v1/devices/#{@device.id}", headers: headers, params: params.to_json

          @json = JSON.parse(response.body)["data"]
        end

        it 'updates the record' do
          expect(@json["attributes"]["name"]).to eq @attribute[:name]
        end
      end
    end

    context 'DELETE /devices/:id' do
      before(:each) do
        headers = { "CONTENT_TYPE": "application/vnd.api+json" }
        @device = FactoryGirl.create(:device)

        delete "/api/v1/devices/#{@device.id}", headers: headers
      end

      it 'return a status code of 204' do
        expect(response.code).to eq "204"
      end
    end

  end
end