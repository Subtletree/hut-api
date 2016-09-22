require 'rails_helper'

RSpec.describe "User authentication", :type => :request do
  describe "Sign in: POST /token-auth" do
    context 'with no credentials' do
      it "responds with error" do
        post '/token-auth'
        expect(response.status).to eq 401
        expect(json['errors'][0]).to eq('Invalid email or password')
      end
    end

    context 'with invalid credentials' do
      it "responds with error" do
        post '/token-auth', params: {"email":"ryannz@msn.com", "password":"secret_wrong"}
        expect(response.status).to eq 401
        expect(json['errors'][0]).to eq('Invalid email or password')
      end
    end

    context 'with valid credentials' do
      let(:user) { FactoryGirl.create(:user) }
      it "responds with JWT" do
        post '/token-auth', params: {"email": user.email, "password":"secret"}
        expect(response.status).to eq 200
        expect(json['token']).to be
      end
    end
  end
end
