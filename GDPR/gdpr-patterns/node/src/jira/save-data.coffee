Jira_Api = require './api'

class Save_Data
  constructor: ->
    @.jira = new Jira_Api()
    @.folder_Data   =  (wallaby?.localProjectDir || './').path_Combine('../data')
    @.folder_Issues = @.folder_Data.path_Combine 'Issues'

  save_Issue: (key, callback)=>
    @.jira.issue key, (data)=>
      callback @.save_Issue_Data data

  save_Issue_Data: (data)->
    if data.key
      issue =
        key: data.key                         # add this field to the issue data saved
      for field in data.fields._keys().sort()
        if data.fields[field]
          issue[field] = data.fields[field]
          file = @.folder_Issues.path_Combine "#{data.key}.json"
      issue.save_Json file
      return file
    else
      return null

  save_Issues: (jql, callback)=>
    #console.log 'Save issues jql: ' + jql
    @.jira.issues jql,["*all"], (data)=>
      files = []
      #console.log 'Got all files, now saving them'
      for item in data
        files.add @.save_Issue_Data(item)
      #console.log 'All files saved'
      callback files

  save_Issues_In_Project_Last_N_Hours: (project, hours, callback) =>
    @.save_Issues "project=#{project} AND updated >= -#{hours}h", callback

  save_Issues_In_Project_Last_N_Days: (project, days, callback) =>
    @.save_Issues "project=#{project} AND updated >= -#{days}d", callback

  save_Issues_In_Project_All: (project, callback) =>
    @.save_Issues "project=#{project}", callback

module.exports = Save_Data