require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'should get the form' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/hello" method="POST">')
      expect(response.body).to include('<input type="text" name="name" />')
    end
  end

  context 'POST /hello' do
    it 'should get greeting message' do
      response = post('/hello', name: 'Aurora')

      expect(response.status).to eq(200)
      expect(response.body).to include('Hi Aurora!')
    end
    
    it 'should return 400 status for input > 50 characters' do
      response = post('/hello', name: 'a' * 51)
      
      expect(response.status).to eq(400)
      expect(response.body).to include('Name must be less than 50 characters')
    end
    
    it 'should strip special characters from input' do
      response = post('/hello', name: 'scripthttpwwwbadsiteruparamsomethingscript')
      
      expect(response.status).to eq(200)
      expect(response.body).to include('scripthttpwwwbadsiteruparamsomethingscript')
    end
  end
end
