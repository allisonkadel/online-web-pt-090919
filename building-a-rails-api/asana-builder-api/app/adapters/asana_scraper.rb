require 'open-uri'
require 'nokogiri'
require 'pry'

class AsanaScraper

    def scrape_asanas

        doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_asanas'))
        attrs_arr = []
        doc.css('table.wikitable.sortable tr').each do |row|
            attrs = {}
            if !row.css('td').empty?
                attrs[:name] = row.css('td').first.text.split("[")[0].strip
                attrs[:sanskrit] = row.css('td')[1].text.strip
                attrs[:english] = row.css('td')[2].text.strip
                attrs[:category] = row.css('td')[3].text.strip
                attrs[:effect_on_spine] = row.css('td')[4].text.strip
                attrs[:suitable_for_meditation] = type = row.css('td')[5].text.strip
                if !row.children.last.css("a").attr("href")
                    attrs[:img] = ""
                else
                    attrs[:img] = row.children.last.css("img").attr("src").value
                end
                attrs_arr << attrs
            end
        end
        File.write('asanas.json', attrs_arr.to_json)
    end

end