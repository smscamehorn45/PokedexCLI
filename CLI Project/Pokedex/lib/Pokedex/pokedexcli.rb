require_relative "./Dex.rb"

class PokedexCLI
  def run
    dex = Pokedex.new
    puts "Beep Boop..Dex booted up! Which pokemon would you like me to load for you, trainer?"
    user_input = gets.chomp
    until user_input == "exit"
      if user_input == "team" || user_input == "new team"
        make_team(dex)
      else
        mon = dex.make_pokemon(user_input.downcase)
        if mon != "error"
          mon.info
        else
          puts "There is no data for this pokemon! Consult professor Oak with your findings!."
        end
      end
      puts "What pokemon would you like to load next? You can also type 'exit' to quit the Pokedex!"
      user_input = gets.chomp
    end
  end

  def make_team(pokedex)
    puts "Alright, let's make a new team! This might take a few moments..."
    pokemon_ids = Array.new(6) { rand(1..829) }
    team = Team.new
    pokemon_ids.each do |id|
      team.add_to_team(pokedex.make_pokemon(id))
    end
    team.list_pokemon
  end
end
