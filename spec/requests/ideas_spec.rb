require 'rails_helper'

RSpec.describe "Ideas", type: :request do
  describe "GET /ideas" do
    it 'get ideas' do
      get "http://localhost3000/ideas"
      expect(response.status).to eq(200)
    end
  end
end