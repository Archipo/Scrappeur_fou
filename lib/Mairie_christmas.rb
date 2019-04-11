require 'rubygems'
require 'open-uri'
require 'Nokogiri'


def get_townhal_email(url)
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/ableiges.html"))
	page.css("td")[7].text
end

def get_all_emails(url)

	page= Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	email_final = Array.new

	townhal_link = page.css('a[class=lientxt]')

	townhal_link.each {|url|
	hash_townhall = Hash.new
	hash_townhall["city"] = url.text
	hash_townhall["email"] = get_townhal_email("http://annuaire-des-mairies.com" + url['href'][1..-1]), email_final.push(hash_townhall)
		}
end

def perform
	get_all_emails("http://annuaire-des-mairies.com/val-d-oise.html")
end

perform

#fonctionne sauf si affiche 503 Service Temporarily Unavailable => problème du au site