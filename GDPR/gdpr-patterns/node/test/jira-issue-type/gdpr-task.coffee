Gdpr_Task   = require '../../src/jira-issue-type/gdpr-task'

describe 'Gdpr', ->

  it 'constructor',->
    using new Gdpr_Task(),->
      @.assert_Is_Object()

  it 'constructor(id)',->
    id =  'GDPR-180'
    using new Gdpr_Task(id),->
      @.id                .assert_Is 'GDPR-180'
      @.issue_Type        .assert_Is 'Task'
      @.summary           .assert_Contains "HR"
      @.business_Function .assert_Is 'Human Resources'
      @.lawful_Basis      .assert_Is ['Article 6(1)(b) - contract', 'Article 9(2)(h) - Health']
      @.data_Location     .assert_Is '?'
      @.data_Security     .assert_Contains "Access Control"
      @.data_Source       .assert_Contains "HRIS"
      @.personal_Data     .assert_Contains "Personal Information"
      @.processing_Purpose.assert_Contains "Dental"
      @.retention_Schedule.assert_Is "?"
      @.recipient         .assert_Contains "London"


