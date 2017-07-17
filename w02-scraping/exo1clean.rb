require 'rubygems'
require 'nokogiri'
require 'open-uri'


def url_95()
	scrap_stockage = Hash.new(0)

	page_val_doise = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	ndd = "http://annuaire-des-mairies.com"

	page_val_doise.css('a.lientxt').each do |ancre_ville|
		ziurl = ndd + ancre_ville["href"]
		zimail = scrap_zimail(ziurl)
		scrap_stockage[ancre_ville.text] = zimail
	end

	puts scrap_stockage
end


def scrap_zimail(urlduscrap)
	contenu_a_scrap = Nokogiri::HTML(open(urlduscrap))
	zimail = contenu_a_scrap.css('p.Style22')[11].text
	return zimail
end

url_95()




