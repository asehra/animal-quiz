module AnimalQuiz
  class QuestionNode
    include ConsoleIO

    attr_reader :question
    attr_accessor :no_node, :yes_node

    def initialize(question)
      @question = question
    end

    def traverse
      print_output "#{question} (y or n)"

      if read_input == 'y'
        self.yes_node = yes_node.traverse
      else
        self.no_node = no_node.traverse
      end

      self
    end
  end
end