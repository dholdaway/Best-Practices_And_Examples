Data = require '../src/data'

describe 'Data', ->
  data = null
  before ->
    data = new Data();

  it 'constructor',->
    using new Data(),->
      @.folder_Data
      @.folder_Data.assert_Folder_Exists()
      @.folder_Issues.assert_Folder_Exists()

  it 'issue_Data', ->
    key = 'GDPR-180'
    using data.issue_Data(key),->
      @.key.assert_Is key

    assert_Is_Null data.issue_Data(null)