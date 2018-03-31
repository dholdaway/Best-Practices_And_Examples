Config = require '../src/config'

describe 'Config', ->

  it 'check values',->
    using Config, ->
      @.protocol  .assert_Is 'http'
      @.apiVersion.assert_Is 'latest'
      if @.via_config
        @.host.assert_Contains 'jira'
      else
        @.host    .assert_Is '{host}'
        @.username.assert_Is '{username}'
        @.password.assert_Is '{password}'
