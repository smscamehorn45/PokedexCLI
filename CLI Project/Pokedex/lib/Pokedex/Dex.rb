require "poke-api-v2"
require "pry"
require_relative './pokemon.rb'

class Pokedex
  def find_pokemon(pokemon)
    begin
      mon = PokeApi.get(pokemon: pokemon)
    rescue JSON::ParserError
      return "error"
    end
    mon
  end

  def make_pokemon(pokemon)
    dex_info = find_pokemon(pokemon)
    if dex_info != "error"
      pokemon_attributes = {}
      pokemon_attributes[:name] = dex_info.name
      pokemon_attributes[:height] = dex_info.height.to_f / 10
      pokemon_attributes[:weight] = dex_info.weight.to_f / 10
      types =  dex_info.types.map{|type| type.type.name}
      pokemon_attributes[:types] = types
      abilities = dex_info.abilities.map{|ability| ability.ability.name}
      pokemon_attributes[:ability] = abilities
      moves = dex_info.moves.map{|moves| moves.move.name}
      pokemon_attributes[:moves] = moves
      Pokemon.new(pokemon_attributes)
    else
      "error"
    end
  end
end
