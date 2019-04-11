require 'rubygems'
require 'open-uri'
require 'Nokogiri'

def get_email (urldeputy)
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/damien-abad"))
	deputy_email = page.xpath('/html/body/div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a').text

	nom = page.css('h1').text
	print nom + " : "
	puts deputy_email

end

def get_all_urls()
	doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	div_classes = doc.xpath('//div[@class="list_table"]')
	all_a = div_classes.css('a')   

	toutes_les_url = all_a.map{|names| urls = 'https://nosdeputes.fr'+names["href"]}

	puts toutes_les_url

	toutes_les_url.each { |url| puts get_email (toutes_les_url) }

end

get_all_urls


#fonctionne presque ... affiche toujours damien abad alors que "puts toutes_les_url" fonctionne .. problème boucle each  ??? :/