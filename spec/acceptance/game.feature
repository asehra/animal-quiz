Feature: Animal quiz can be played on command line. 

  Scenario: Game can be started with cli
    When I run 'animal-quiz'
    Then the output contains 'Think of an animal...'
    And the output contains 'Is it an elephant?'