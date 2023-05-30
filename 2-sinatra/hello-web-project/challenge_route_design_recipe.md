# POST /sort-names Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

|What does it do?|Method|Path|Query parameters?|Body parameters?|
|--|--|--|--|--|

Takes a comma-separated list of names, sorts and returns them as a comma-separated list

Method: POST
path: /sort-names
Body parameters:
  names=Joe,Alice,Zoe,Julia,Kieran

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- Expected response: 200 OK -->

Alice,Joe,Julia,Kieran,Zoe
```


## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /sort-names
  Body params:
    names=Joe,Alice,Zoe,Julia,Kieran

# Expected response:

Response for 200 OK

Alice,Joe,Julia,Kieran,Zoe
```


## 4. Encode as Tests Examples

```ruby
# file: spec/integration/challenge_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app.rb'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /sort-names" do
    it 'returns 200 OK' do
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
