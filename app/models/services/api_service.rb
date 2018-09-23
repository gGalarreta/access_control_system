class ApiService

  require 'rest-client'
  require 'json'

  attr_reader :url, :headers, :timeout, :open_timeout

  def initialize(args = {})
    @url = 'localhost:3000/api/v1/'
    @headers = {accept: :json}
    @timeout = 5
    @open_timeout = 5
  end

  def post body, params
    begin
      url_service = end_point_handler params
      headers_service = token_handler params
      service_response = RestClient::Request.execute(method: :post, url: url_service, payload: body, timeout: timeout, open_timeout: open_timeout, headers: headers_service)
      response = {
        "status": service_response.code,
        "data": JSON.parse(service_response)
      }
    rescue Exception => e
      p e
    end
  end

  def get params
    begin
      url_service = end_point_handler params
      headers_service = token_handler params
      service_response = RestClient::Request.execute(method: :get, url: url_service, timeout: timeout, open_timeout: open_timeout, headers: headers_service)
      response = {
        "status": service_response.code,
        "data": JSON.parse(service_response)
      }    
    rescue Exception => e
      p e
    end
  end

  private

    def token_handler params
      headers_service = headers
      headers_service["Authorization"] = params[:token] if params[:token].present?
      headers_service
    end

    def end_point_handler params
      url_service = url + params[:end_point]
    end
end