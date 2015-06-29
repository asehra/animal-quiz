module AnimalQuiz
  class QuestionNode

    attr_reader :question
    attr_accessor :no_node, :yes_node

    def initialize(question)
      @question = question
    end

    def traverse
      puts question
    end
  end
end