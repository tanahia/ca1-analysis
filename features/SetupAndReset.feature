Feature: Record setup time and reset time separately from the activity time and flag an overlap with another booking in the same space

  @FR6 @P6
  Scenario: Booking that starts during another group's reset time is flagged
    Given a club has booked the sports hall from 12:00 to 15:00 on a stated date
    And that booking has 30 minutes of reset time after the activity, so the hall is not free until 15:30
    When a staff member records a second booking for the sports hall on the same date starting at 15:15
    Then the second booking is flagged as overlapping the first booking's reset time
    And the setup and reset time of the first booking is shown separately from its activity time
    And a booking for the sports hall starting at 15:30 is not flagged as an overlap
