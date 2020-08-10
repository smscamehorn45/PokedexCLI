class Pokemon
    attr_accessor :name, :height, :weight, :types, :ability, :moves
  
    def initialize(attributes)
      attributes.each {|key, value| self.send(("#{key}="), value)}
    end
  
    def info
      puts " #{@name} is #{@height} meters tall! #{@name} weighs a total of #{@weight} kilos! #{@name} type(s) are: #{@types.join(", ")}. #{@name} may be found with the following abilities #{@ability}. #{@name} can be taught the moves! #{@moves}
      "
    end
  end