Data         = require './data'

jira_Details = new Data().folder_Data.path_Combine('jira-details.json').load_Json()

config_data =
  via_config : jira_Details?
  protocol   : 'http',
  host       : jira_Details?.host       ||'{host}'    ,
  username   : jira_Details?.username   ||'{username}',
  password   : jira_Details?.password   ||'{password}',
  apiVersion : jira_Details?.apiVersion || 'latest'   ,
  strictSSL  : false


module.exports = config_data
