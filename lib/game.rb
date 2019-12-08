class Game 
     @@all = []
    attr_accessor :title,:url_link, :description
    def self.all
        @@all
    end
    def save 
        @@all << self
    end

    def self.find_by_url(url)
        self.all.find {|game| game.url_link == url}
    end

end