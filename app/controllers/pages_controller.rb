#require 'rest-client'
#require 'pry'
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @loan_proposals = LoanProposal.all
    @status = LoanProposal.where(user_id: current_user.id)
    if current_user.role == "farmer" && !@status.empty?
      if @status[0].accepted == "Enviado"
        @a = "active"
        @b = ""
        @c = ""
      elsif @status[0].accepted == "analise"
        @a = "active"
        @b = "active"
        @c = ""
      else
        @a = "active"
        @b = "active"
        @c = "active"
      end
    end

  end

  def gettoken
    # uri = URI.parse("https://api.cnptia.embrapa.br/token")
    # request = Net::HTTP::Post.new(uri)
    # request["Authorization"] = "Basic R1RDZjBITFRTRkRVbmsyQncyakFVVFV3STBzYTpXUjNUekpBREpaT1B1WUxGVnZQMmpnU2h3QWth"
    # request.set_form_data(
    #   "grant_type" => "client_credentials",
    # )

    # req_options = {
    #   use_ssl: uri.scheme == "https",
    #   verify_mode: OpenSSL::SSL::VERIFY_NONE,
    # }

    # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    #   http.request(request)
    # end
    # @token = JSON.parse(response.body)
    # return @token["access_token"]
  end

  def getzon(crop,ibge,token)

  #   uri = URI.parse("https://api.cnptia.embrapa.br/agritec/v1/zoneamento?idCultura=#{crop}&codigoIBGE=#{ibge}")
  #   request = Net::HTTP::Get.new(uri)
  #   request["Accept"] = "application/json"
  #   request["Authorization"] = "Bearer #{token}"

  #   req_options = {
  #     use_ssl: uri.scheme == "https",
  #     verify_mode: OpenSSL::SSL::VERIFY_NONE,
  #   }

  #   response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  #     http.request(request)
  #   end
  #   @zone = JSON.parse(response.body)["data"]
  end
end
