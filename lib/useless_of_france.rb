require 'pry'
require'open-uri'
require 'nokogiri'
require 'httparty'

def name_and_link_of_useless
    name_deputy = []
    link_deputy = []
    index = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

    index.xpath('//*[@id="deputes-list"]/div/ul/li/a').each do |name| #PUSH ALL FIRST NAME AND NAME OF ALL DEPUTY IN ARRAY
        name_deputy << name.text
    end

    index.xpath('//*[@id="deputes-list"]/div/ul/li/a/@href').each do |href| #PUSH ALL THE HREF OF A BALISE IN AN ARRAY
        link_deputy << href.text
    end
    link_deputy.map!{|i| i.gsub("fiche/OMC_","")}

    return name_deputy, link_deputy #RETURN AN ARRAY WITH NAME AND ANOTHER ONE WITH HREF
end


def mail_deputy(name, href)
    
    deputy_mail = []
    href.each do |link|
    profile_page = Nokogiri::HTML(URI.open("https://www.assemblee-nationale.fr/dyn#{link}"))
    puts profile_page.xpath('//*[@id="main"]/div/div/div/section[2]/div/ul/li[1]/a/span[2]').text
    deputy_mail << profile_page.xpath('//*[@id="main"]/div/div/div/section[2]/div/ul/li[1]/a/span[2]').text
    end
    return deputy_mail
end

def adjust_name(name, href)
    name.map!{|i| i.gsub("M. ","")}
    name.map!{|i| i.gsub("Mme ","")}
    first_name = []
    last_name = []
    name.each do |i|
        first_n, last_n = i.split(" ")
        first_name << first_n
        last_name << last_n
    end
    return first_name, last_name
end

    def array_of_hash(mail, first_n, last_n)
        email = Hash[email(mail.zip)]
        first_name = Hash[first_name(first_n.zip)]
        last_name = Hash[last_name(last_n.zip)]
    info_of_all_deputy = []
    [info_of_all_deputy, email, first_name, last_name].each do |hash|
    info_of_all_deputy << hash
      end
      puts info_of_all_deputy
    end

def perfom
   name, href = name_and_link_of_useless
   first_n, last_n = adjust_name(name, href)
   mail = mail_deputy(name, href)
   array_of_hash(mail, first_n, last_n)
end

perfom