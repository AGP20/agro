class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
  end

  def gettoken
    uri = URI.parse("https://api.cnptia.embrapa.br/token")
    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = "Basic R1RDZjBITFRTRkRVbmsyQncyakFVVFV3STBzYTpXUjNUekpBREpaT1B1WUxGVnZQMmpnU2h3QWth"
    request.set_form_data(
      "grant_type" => "client_credentials",
    )

    req_options = {
      use_ssl: uri.scheme == "https",
      verify_mode: OpenSSL::SSL::VERIFY_NONE,
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    @token = JSON.parse(response.body)
    return @token["access_token"]
  end
end
