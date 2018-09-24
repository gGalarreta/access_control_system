class ApiService

  require 'rest-client'
  require 'json'

  attr_reader :url, :headers, :timeout, :open_timeout

  def initialize(args = {})
    @url = 'localhost:3000/api/v1/'
    @headers = {accept: :json}
    @timeout = 10
    @open_timeout = 10
  end

  def post body, params
    begin
      request_handler({method: :post, payload: body}, params)
    rescue Exception => e
      p e
    end
  end

  def get params
    begin
      request_handler({method: :get}, params)
    rescue Exception => e
      p e
    end
  end

  def delete params
    begin
      request_handler({method: :delete}, params)
    rescue Exception => e
      p e
    end
  end

  def put body, params
    request_handler({method: :put, payload: body}, params)   
  end

  private

    def request_handler request, params
      request_params = Hash.new
      request_params[:method] = request[:method]
      request_params[:url] = end_point_handler params
      request_params[:timeout] = timeout
      request_params[:open_timeout] = open_timeout
      request_params[:headers] = token_handler params
      request_params[:payload] = request[:payload] if request[:payload]
      service_response = RestClient::Request.execute(request_params)
      response = {
        "status": service_response.code,
        "data": JSON.parse(service_response)
      }
    end

    def token_handler params
      headers_service = headers
      headers_service["Authorization"] = params[:token] if params[:token].present?
      headers_service
    end

    def end_point_handler params
      url_service = url + params[:end_point]
    end
end