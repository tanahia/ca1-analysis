Feature: Record a space as unavailable without closing the whole facility

Background:
    Given a facility has a sports hall, training room and pitch and each of them can be booked

  Rule: Only the affected space becomes unavailable

    @FR1 @P1
    Scenario: Maintenance restricts one selected space only
      Given a staff member has been told that the sports hall will be out of service for maintenance from 09:00 to 17:00 on a stated date
      When  staff member records the sports hall as unavailable for that date and time range with the reason "Maintenance"
      Then sports hall is shown as unavailable for that date/time range with the reason "Maintenance"
      And a booking request for the sports hall within that date/time range cannot be accepted
      And the training room and the pitch can still be booked for the same range

  Rule: A restriction of space must have a date, time range and reason

    @FR1 @P1
    Scenario: Restriction of space without a reason is not recorded
      Given a staff member has been told that the training room will be out of service from 10:00 to 12:00 on a stated date
      And the reason for the restriction is not known
      When staff member tries to record the training room as unavailable without a reason
      Then training room is not recorded as unavailable
      And the staff member must obtain the reason (maintenance, inspection or community event) from the maintenance officer before recording it
