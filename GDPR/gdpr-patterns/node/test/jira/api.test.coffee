Jira_Api = require '../../src/jira/api'

describe 'Jira_Api', ->
  #@.timeout 3000
  jira = null

  before ->
    jira = new Jira_Api()

  it 'constructor', ->
    using jira, ->
      @._jira_Api.protocol.assert_Is 'http'

  it 'api', ->
    jira.api.assert_Is_Function()

  it 'currentUser', ()->
    jira.currentUser (name)->
      name.assert_Is 'jira.api'

  it 'issue', ()->
    jira.issue 'RISK-1', (issue)->
      issue.fields.summary.assert_Is 'JIRA - Too many JIRA Administrators'

  it 'issues', ->
    jira.issues "issue in linkedIssues(Risk-218)", (issues)->
      issues.size().assert_Is_Bigger_Than 10

  it 'search', ()->
    jira.search "project=RISK", (data)->
      data.total.assert_Is_Bigger_Than 398
      data.issues.size().assert_Is 50