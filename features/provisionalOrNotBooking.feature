Feature: Mark each booking as provisional or confirmed and link the dates of a recurring block

  @FR7 @P5
  Scenario: Confirming one date of a recurring block leaves the other dates provisional
    Given a school has requested a recurring block for the training room on four dates
    And all four dates are recorded as provisional and linked as one block of bookings
    When a staff member confirms the booking for the first date
    Then the first date is shown as confirmed
    And the other three dates are still shown as provisional
    And all four dates are still shown as part of the same block
