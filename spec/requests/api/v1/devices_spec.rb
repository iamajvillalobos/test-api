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

  end
end