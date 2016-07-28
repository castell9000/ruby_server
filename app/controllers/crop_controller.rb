class CropController < ApplicationController

 require 'rubygems'
  require 'rest-client'
  require 'cgi'
  require 'crack'
  require 'json'
  require 'uri'
  require 'addressable/uri'

  def findcode
    url = 'http://www.rda.go.kr/openapidata/service/newvariety_api/newvariety_itmcode'
    serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
    serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
    headers = { :params => { CGI::escape('ServiceKey') => serviceKey2} }
    response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

    myXML  = Crack::XML.parse(response)
    myJSON = myXML.to_json

    render json: myJSON
  end

  def fncode
    url = 'http://www.rda.go.kr/openapidata/service/newvariety_api/newvariety_fncode'
    serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
    serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
    headers = { :params => { CGI::escape('ServiceKey') => serviceKey2} }
    response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

    myXML  = Crack::XML.parse(response)
    myJSON = myXML.to_json

    render json: myJSON
  end

  def dcode
    url = 'http://www.rda.go.kr/openapidata/service/newvariety_api/newvariety_dcode'
    serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
    serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
    headers = { :params => { CGI::escape('ServiceKey') => serviceKey2} }
    response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

    myXML  = Crack::XML.parse(response)
    myJSON = myXML.to_json

    render json: myJSON
  end
  def ycode
    url = 'http://www.rda.go.kr/openapidata/service/newvariety_api/newvariety_gryear?category_code=FC'
    serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
    serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
    headers = { :params => { CGI::escape('ServiceKey') => serviceKey2} }
    response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

    myXML  = Crack::XML.parse(response)
    myJSON = myXML.to_json

    render json: myJSON

  end

  def list
    url = 'http://www.rda.go.kr/openapidata/service/newvariety_api/newvariety_list'
    serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
    serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
    d_cd = params[:d_cd]
    year = params[:year]
    fn_cd = params[:fn_cd]
    headers = { :params => { CGI::escape('dcode') => d_cd,CGI::escape('gryear') =>year,CGI::escape('fncode') =>fn_cd,CGI::escape('numOfRows') => '999',CGI::escape('pageNo') => '1',CGI::escape('ServiceKey') => serviceKey2} }
    response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

    myXML  = Crack::XML.parse(response)
    myJSON = myXML.to_json

    render json: myJSON
  end
end
