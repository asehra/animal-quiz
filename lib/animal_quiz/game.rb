module AnimalQuiz
  class Game
    def initialize
      @decision_tree = AnimalNode.new('elephant')
    end

    def play
      puts 'Think of an animal...'
      
      @decision_tree = @decision_tree.traverse

      puts 'Play again? (y or n)'
      play if gets.chomp == 'y'
    end
  end
end