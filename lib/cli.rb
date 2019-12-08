class CLI
     def run 
        Scraper.new.first_page
        prompt
     end

    def prompt 
      puts "****************Choose*********************"
      puts "******************A************************"
      puts "*****************Game**********************"
      puts "*****************To************************"
      puts "*****************Play**********************"
    # Show games
    
     Game.all.each.with_index(1) {|game ,idx|puts "#{idx}. #{game.title}"}
     user_input = gets.chomp
     index = user_input.to_i - 1
     @selected_game = Game.all[index]
     
     game_profile 
     end


     def game_profile 
      @game = Scraper.new.second_page(@selected_game.url_link)
      puts "#{@game.title}\n"
      puts "Description: "
      puts @game.description
      @message =  "You want to see more games?(1) press (2) quit!"
      second_prompt   
   end
      
   def second_prompt
      puts @message
      user_input = gets.chomp 

      if user_input == "1"
         prompt 
      elsif user_input == "2"
         puts "quit"
      else 
         @message = "Please select (1) for more games.. Or (2) to quit"
         second_prompt
      end 
   end
         
     
         
      
     


end