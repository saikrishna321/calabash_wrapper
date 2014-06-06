Feature: Network

@no_connection_to_qaserver
Scenario: System Unavailable
When I login
Then I should see the system is unavailable message

@slow
@no_network
Scenario: Network error
When I login
Then I should see a network error message