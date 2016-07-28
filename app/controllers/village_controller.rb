class VillageController < ApplicationController

  require 'rubygems'
  require 'rest-client'
  require 'cgi'
  require 'crack'
  require 'json'
  require 'uri'
  require 'addressable/uri'

  def village_find

  url = 'http://openapi.invil.org/openapi/service/rest/VilageInfoService/getAreaAcctoVilageItem'
  serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
  serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
  code1 = params[:code]
  headers = { :params => { CGI::escape('ServiceKey') => serviceKey2,CGI::escape('villageCode') => code1,CGI::escape('numOfRows') => '999',CGI::escape('pageNo') => '1' } }
  response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

  myXML  = Crack::XML.parse(response)
  myJSON = myXML.to_json

  render json: myJSON
  end

  def village_sido
    url = 'http://openapi.invil.org/openapi/service/rest/VilageInfoService/getSidoList'
    serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
    serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
    headers = { :params => { CGI::escape('ServiceKey') => serviceKey2,CGI::escape('numOfRows') => '999',CGI::escape('pageNo') => '1' } }
    response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

    myXML  = Crack::XML.parse(response)
    myJSON = myXML.to_json

    render json: myJSON
  end

  def village_region
    url = 'http://openapi.invil.org/openapi/service/rest/VilageInfoService/getAreaAcctoVilageList'
    serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
    serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
    code1 = params[:code]
    headers = { :params => { CGI::escape('ServiceKey') => serviceKey2,CGI::escape('searchSidoCode') => code1, CGI::escape('numOfRows') => '999',CGI::escape('pageNo') => '1' } }
    response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

    myXML  = Crack::XML.parse(response)
    myJSON = myXML.to_json

    render json: myJSON
  end

end
