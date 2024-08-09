# gem install rspec
# rspec api_test.rb

require 'rspec'
require './api_client'

RSpec.describe ApiClient do
  let(:client) { ApiClient.new }
  let(:url) { 'http://toastytech.com/evil/' }

  it "returns the response body from the GET request" do
    response = client.get_resource(url)

    expect(response).not_to be_empty
    puts response
  end
  
  it "returns rectangle surface on POST request with sides" do
	url = 'http://127.0.0.1:5000/rectangle/surface'
	params = { 'length' => '5', 'width' => '3' }

	response = client.post_resource(url, params)

	puts "Response Body: #{response}"
	expect(response[:body]).not_to be_empty
	expect(response[:code]).to eq(200)
  end
  
end
