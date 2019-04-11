require 'rubygems'
require 'open-uri'
require 'Nokogiri'

def crypto_scraper 

    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

    crypto_values = page.css('[class=price]')
    crypto_names = page.css("a[class='currency-name-container link-secondary']")

    crypto_names_second = crypto_names.map { |crypto_name| crypto_name.text }
    crypto_values_second = crypto_values.map { |crypto_value| crypto_value.text }

    crypto_hash_final = Hash[crypto_names_second.zip(crypto_values_second)]

    puts crypto_hash_final
end

crypto_scraper

#fonctionne