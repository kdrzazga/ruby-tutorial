require 'net/http'
require 'uri'

class ApiClient
	def get_resource(url)
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true if uri.scheme == 'https'
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request)
	
		response.body
	end

	def post_resource(url, params)
		uri = URI.parse(url)	
		http = Net::HTTP.new(uri.host, uri.port)	
		http.use_ssl = true if uri.scheme == 'https'	
		request = Net::HTTP::Post.new(uri.request_uri)	
		
		request.set_form_data(params)	
		
		response = http.request(request)	
		
		{body: response.body, code: response.code.to_i }
	end
end
