Feature: Animal quiz can be played on command line. 

  Scenario: Quiz starts with a guess
    When I run 'animal-quiz'
    Then the quiz says:
      """
      Think of an animal...
      Is it an elephant?
      """

  Scenario: Quiz asks to start over when guess is correct
    Given I am playing 'animal-quiz'
    When the guess is correct
    Then the quiz says:
      """
      I win
      Play again?
      """

  Scenario: Quiz asks for the correct answer when guess is incorrect
    Given I am playing 'animal-quiz'
    When the guess is incorrect
    Then the quiz says:
      """
      You win. Help me learn from my mistake before you go...
      What animal were you thinking of?
      """

  Scenario: Quiz learns new animal by asking for a question to distinguish with original guess
    Given the 'animal-quiz' has asked me for the correct answer
    When I answer 'rabbit'
    Then the quiz says 'Give me a question to distinguish a rabbit from an elephant.'

  Scenario: Quiz learns the answer to the new question
    Given the 'animal-quiz' has asked me for a question to distinguish a 'rabbit'
    When I answer 'Is it a small animal?'
    Then the quiz says 'For a rabbit, what is the answer to your question? (y or n)'