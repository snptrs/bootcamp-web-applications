require "spec_helper"
require "rack/test"
require_relative '../../app.rb'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
      response = get('/names')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "GET /hello" do
    it 'returns an HTML page' do
      response = get('/hello')
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Hello!</h1>")
    end
  end
end
