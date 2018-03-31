Save_Data = require '../../src/jira/save-data'

xdescribe 'Save-Data', ->
  save_Data = null

  before ->
    save_Data = new Save_Data()

  it 'constructor', ->
    using save_Data, ->
      @.jira._jira_Api.apiVersion.assert_Is 'latest'
      @.folder_Data.assert_Folder_Exists()
      @.folder_Issues.assert_Folder_Exists()

  it 'save_Issue', ->

    save_Data.save_Issue 'RISK-1', (file)->
      file.assert_File_Exists()
      using file.load_Json(),->
          @._keys().size().assert_Is 31
          @.key.assert_Is 'RISK-1'

  xit 'save_Issues', ->
    jql = "issue in linkedIssues(Risk-218) and issuetype = 'Risk'"
    save_Data.save_Issues jql, (data)->
      data[0].assert_File_Exists

  @.timeout 15000
  xit 'save_Issues_In_Project (RISK) last 1 day', ->
    save_Data.save_Issues_In_Project 'RISK',1, (files)->
      files.assert_Size_Is_Bigger_Than 400

  xit 'save_Issues_In_Project (SEC) last 5 days', ->
    @.timeout 15000
    save_Data.save_Issues_In_Project 'SEC', 5,  (files)->
      files.assert_Size_Is_Bigger_Than 700

xdescribe 'Data-Analysis | Check Data collected', ->
  save_Data = null

  before ->
    save_Data = new Save_Data()

  it 'check that linked issues are saved', ->
    save_Data.save_Issue 'Risk-218', (file, data)->
      using file.load_Json(), ->
        @.issuelinks.assert_Size_Is_Bigger_Than 10
        @.issuelinks[0].outwardIssue.key.assert_Is 'RISK-244'
