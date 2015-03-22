Feature: Send RSVP
  In order to inform Alex and Christophe
  As a guest
  I want to give RSVP info
  
  Scenario: Create RSVP
    Given I have been invited
    When I go to root_path
    And I fill in "arrival" with "friday_marmande_1800"
    And I fill in "friday_dinner" with "no"
    And I fill in "saturday_lunch" with "yes"
    And I fill in "sunday_lunch" with "yes"
    And I fill in "sunday_dinner" with "no"
    And I fill in "departure" with "sunday_marmande_1600"
    And I fill in "nb_guests" with 4
    And I fill in "nb_children" with 2
    And I fill in "name" with "Joe Dalton"
    And I fill in "email" with "joe.dalton@gmail.com"
    And I press "Envoyer"
    Then I should see "Merci"
    And I should see "Nous vous attendons au château pour déjeuner samedi"
    And I should see "Une voiture viendra vous chercher en gare de Marmande vendredi à 18h"
    And I should see "Cela nous fera plaisir de prolonger le mariage en déjeunant ensemble dimanche"
    And I should see "Une voiture vous ramènera en gare de Marmande pour votre train de 16h"
    And I should see "Vous allez dormir Une chambre pour 4 personnes dont 2 adultes vous est réservée (à partir de vendredi). Nous vous indiquerons à votre arrivée au château où se trouve votre chambre"
    And I should see "N'hésitez pas à nous appeler si vous avez des questions"
    And I should have 1 rsvp
    