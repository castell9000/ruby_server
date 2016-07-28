class TaskController < ApplicationController
require 'mechanize'
require 'nokogiri'
def index
render text: 'hello world'
end
def jibun
    url = 'http://openapi.epost.go.kr/postal/retrieveLotNumberAdressAreaCdService/retrieveLotNumberAdressAreaCdService/getLotNumberListAreaCd'
    serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
    serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
    headers = { :params => { :ServiceKey=> serviceKey2,CGI::escape('brtcCd') => '부산',CGI::escape('signguCd') => '사상',CGI::escape('emdCd') => '주례' } }
    response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

    myXML  = Crack::XML.parse(response)
    myJSON = myXML.to_json
    respond_to do |format|
      format.html
      format.xml { render :xml =>  response }
      format.json { render :json => myJSON}
	end
end
def maeul
	url = 'http://openapi.invil.org/openapi/service/rest/VilageInfoService/getAreaAcctoVilageList'
	serviceKey = '3MCAwjJGca/jyMQ6u8fYWdmDV%2BLSZBWjhz5yLy8i%2B6vgWiBPbFqKG0Af4kXKcD6l0hdxQpHV5F4%2BRBdshD%2BoNg%3D%3D'
	sidoCode = params[:sido]
#serviceKey = 'XkZj7BdjeGc7MQ98ZNrfHYsd2%2BKg280Bm62mCWjf97S9Vr1j96fBPtUyAA%2BbE5/QbSXP6EWBM2oIFptfVXde7g%3D%3D'
	serviceKey2 = Addressable::URI.parse(serviceKey).normalize.to_s
	headers = { :params => { CGI::escape('ServiceKey') => serviceKey2,CGI::escape('searchSidoCode') => sidoCode,CGI::escape('numOfRows') => '999',CGI::escape('pageNo') => '1' } }
	response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

	myXML  = Crack::XML.parse(response)
	myJSON = myXML.to_json
    respond_to do |format|
      format.html
      format.xml { render :xml =>  response }
      format.json { render :json => myJSON}
        end



end
  def sido_gun
    @data=''
    agent = Mechanize.new
    page = agent.get("http://www.returnfarm.com/rtf/m3/n36/business/selectBusinessInfo.do")

    search_form = page.form_with :name => "businessForm"
    search_form.field_with(:name => "sido_cd").value = params[:sido].to_s.strip
    search_form.field_with(:name => "sigun_cd").value = params[:sigun].to_s.strip
    search_results = agent.submit search_form
    agent.page.parser.class
     agent.page.parser.css('p.point_text2').each do |res|
        @re =  '지역 : '+res.text.strip
    end
    agent.page.parser.css('div.baseSec03').each do |res|
            @data.concat(res.text.squeeze(" \n"))
    end
    render 'task/sido'
  end
def helpHouse
    @result=''
    agent = Mechanize.new
    page = agent.get('http://www.returnfarm.com/rtf/m3/n35/rthome/usrRthomeInfo.do')
    search_form = page.form_with :name => 'sForm'
    search_form.field_with(:name => 'sido_cd').value = params[:sido].to_s.strip
    search_form.field_with(:name => 'sigun_cd').value = params[:sigun].to_s.strip
    search_results = agent.submit search_form
    agent.page.parser.class
    target = agent.page.parser.css('table.table01 tbody')
    for i in 0...target.css('tr').length
        if i!=0&&i%8==0
            target.css('tr')[i].remove
        end
    end
    target.each do |res|
    res.css('tr').each do |fix|
        @result << fix.css('td:not(div)')[1].text.strip+'\n'
    end
    end
    @fix = @result.split("\\n").each_slice(8).map{|s| {sido: s[0], sigun: s[1], name: s[2],scale:s[3],price:s[4],period:s[5],day:s[6],tel:s[7] }}
    render :json=>@fix
end
def welfare

  @result =''
  agent = Mechanize.new
  page = agent.get("http://www.returnfarm.com/rtf/m3/n39/information/selectInformationList.do")

  search_form = page.form_with :name => "informationForm"
  search_form.field_with(:name => "sido_cd").value = params[:sido].to_s.strip
  search_form.field_with(:name => "sigun_cd").value = params[:sigun].to_s.strip
  search_results = agent.submit search_form
  agent.page.parser.class

  agent.page.parser.css('table.table01 tbody tr').each do |res|
    @result << res.css('td')[1].text.gsub(/\n/,' ').strip+'\n'
  end
    @fix = @result.split("\\n").each_slice(4).map{|s| {name: s[0], target: s[1], contents: s[2],tel:s[3] }}
    render :json=> @fix

end
def town
    sido = params[:sido]
    data = Town.where(["address LIKE ?", "%#{sido}%"])
    #fix_data = data[0]['address'].split(' ')
    render :json => data
end
def test01
    render text: 'git 백지환 성공적'
end
end
