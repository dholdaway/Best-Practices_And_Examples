require 'fluentnode'

class Data
  constructor: ->
    @.folder_Data   =  (wallaby?.localProjectDir || './..').path_Combine('./../data')
    @.folder_Issues = @.folder_Data.path_Combine 'Issues'

  issue_Data: (id)->
    file = @.folder_Issues.path_Combine("#{id}.json")
    if file.file_Exists()
      return file.load_Json()
    return null



module.exports = Data



