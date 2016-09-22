require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "Create: POST /users" do
    context 'With no information' do
      it "responds with error" do
        pending
        post '/users'
        expect(response.status).to eq 422
        expect(json['errors']).to eq('Invalid email or password')
      end
    end
    context 'With incomplete information' do
      it "responds with error" do
        pending
        post '/users'
        expect(response.status).to eq 422
        expect(json['errors']).to eq('Invalid email or password')
      end
    end
    context 'With valid information' do
      let(:user) { FactoryGirl.build(:user) }
      it "responds with success" do
        p payload(user, [:first_name, :last_name, :mobile_number, :email, password: 'secret', password_confirmation: 'secret'])
        post '/users', params: payload(user, [:first_name, :last_name, :mobile_number, :email, :password, :password_confirmation])
        #expect(response.status).to eq 200
        expect(json['errors']).to eq('Invalid email or password')
      end
    end
  end
end
