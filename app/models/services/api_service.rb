class ApiService

  require 'rest-client'
  require 'json'

  attr_reader :url, :headers, :timeout, :open_timeout

  def initialize(args = {})
    @url = 'localhost:3000/api/v1/sessions'
    @headers = {accept: :json}
    @timeout = 5
    @open_timeout = 5
  end

  def post body
    begin
      service_response = RestClient::Request.execute(method: :post, url: url, payload: body, timeout: timeout, open_timeout: open_timeout, headers: headers)
      response = {
        "status": service_response.code,
        "data": JSON.parse(service_response)
      }
    rescue Exception => e
      p e
    end
  end
end