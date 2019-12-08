class Scraper
    def first_page
        site = "https://www.pocketgamer.com/ios/"
        opened_site = open(site)
        page = Nokogiri::HTML(opened_site)
        games = page.css(".game-block")
        games.each do |game|
           game_= Game.new
           game_.title = game.css("h3").text
           game_.url_link = game.css("a")[0]["href"]
           game_.save
        end
   
    end
       def second_page(url_link)
           site = "https://www.pocketgamer.com#{url_link}"
           opened_site = open(site)
           page = Nokogiri::HTML(opened_site)

           game = Game.find_by_url(url_link)
           game.description = page.css(".prd-desc").text
           
           game   
       end
   


end