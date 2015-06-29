module AnimalQuiz

  class AnimalNode 
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def traverse
      print_output "Is it an #{ name }?"

      answer = read_input

      if answer == 'y'
        print_output 'I win'
        self
      else
        learn_new_animal
      end
    end

    private 

    def learn_new_animal
      new_animal = obtain_new_animal

      print_output "Give me a question to distinguish a #{ new_animal.name } from an #{ name }."
      question = QuestionNode.new(read_input)
      
      print_output "For a #{ new_animal.name }, what is the answer to your question? (y or n)"

      if read_input == 'y'
        question.yes_node = new_animal
        question.no_node = self
      else
        question.yes_node = self
        question.no_node = new_animal
      end

      print_output "Thanks"

      question
    end

    def obtain_new_animal
      print_output 'You win. Help me learn from my mistake before you go...'
      print_output 'What animal were you thinking of?'
      AnimalNode.new(read_input)
    end

    def read_input
      gets.chomp
    end

    def print_output(output)
      puts(output)
    end
  end
end