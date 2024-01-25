require 'pry'
require 'nokogiri'
require 'open-uri'


#LOOP ALL THE LINK FOR ALL COMMUNE AND TAKE THE MAIL ADRESS FOR EACH PAGE
def get_townhall_email(townhall_url)
    all_mail = []
    city_name = []
    city_name = townhall_url

    townhall_url.each do |link|
    email_link = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com#{link}"))
    all_mail << email_link.css("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    end
    # TAKE THE NAME OF EACH COMUNE
    index = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    city_name = []
    index.xpath('//*[@class="lientxt"]').each do |i|
        city_name << i.text
    end
#CREATE A HASH AND THEN PUTS THE KEY AND VALUE IN AN ARRAY
    hash_city_mail = Hash[city_name.zip(all_mail)]
    final_array = []
    hash_city_mail.each do |k, v|
        final_array << {k => v}
    end
    return final_array
end




#RETURN THE REST OF THE LINK WE NEED TO GO ON THE COMMUNE PAGE
def get_townhall_urls
index = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
href_city = []
    index.xpath('//*[@class="lientxt"]/@href').each do |i|
        href_city << i.text
    end
return href_city.map{|link| link.slice(1..-1)}
end




def perform
   return get_townhall_email(get_townhall_urls) 
end

perform






