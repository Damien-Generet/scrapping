require 'pry'
require 'nokogiri'
require 'open-uri'

def name
    crypto_name = []
    crypto_page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    crypto_page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[1]').each do |name|
        crypto_name << name.text
    end
    return crypto_name
end


def price
    crypto_price = []
    crypto_page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    crypto_page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span[1]').each do |price|
        crypto_price << price.text
    end
    return crypto_price
end



def final_info(price, name)
    crypto_info = Hash[name.zip(price)]
    array_display = []

    crypto_info.each do |k, v|
        array_display << {k => v}
    end
    return array_display
    puts array_display.inspect
end


def perform
   puts final_info(price, name)
   return final_info(price, name)
end
perform
