# GET /artists Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

|What does it do?|Method|Path|Query parameters?|Body parameters?|
|--|--|--|--|--|

Returns a list of artists
Method: GET
Path: /artists
No parameters

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- Expected response: 200 OK -->
Pixies, ABBA, Taylor Swift, Nina Simone
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /artists

# Expected response:

Response for 200 OK
Pixies, ABBA, Taylor Swift, Nina Simone
```

## 4. Encode as Tests Examples

```ruby
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /artists" do
    it 'returns 200 OK' do
      response = get('/artists')
      expect(response.status).to eq(200)
      expect(response.body).to include("Pixies, ABBA, Taylor Swift, Nina Simone")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
