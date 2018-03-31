Data = require '../Data'

class Gdpr_Task
  constructor: (id)->
    @._map_Data(id)

  _map_Data: (id)->
    data = new Data().issue_Data(id)
    if data
      @.id                  = data.key
      @.issue_Type          = data.issuetype.name
      @.summary             = data.summary?.trim()
      @.assignee            = data.assignee?.name
      @.business_Function   = @.map_on_Value       data, "customfield_14115"
      @.data_Function       = @.map_on_Value       data, "customfield_14117"
      @.data_Location       = @.map_on_Value       data, "customfield_14125"
      @.data_Security       = @.map_Array_on_Lines data, "customfield_14122"
      @.data_Source         = @.map_Array_on_Lines data, "customfield_14124"
      @.lawful_Basis        = @.map_Array_on_Value data, "customfield_14123"
      @.personal_Data       = @.map_Array_on_Lines data, "customfield_14127"
      @.processing_Purpose  = @.map_on_Value       data, "customfield_14128"
      @.retention_Schedule  = @.map_on_Value       data, "customfield_14121"
      @.recipient           = @.map_on_Value       data, "customfield_14129"


  map_on_Value: (data, field_Id)->
    if field_Id and data[field_Id]
      return data[field_Id].value || data[field_Id].trim()
    return ""

  map_Array_on_Value: (data, field_Id)->
    result = []
    console.log field_Id
    if field_Id and data[field_Id]
      for item in data[field_Id]
        result.push item.value
    result

  map_Array_on_Lines: (data, field_Id)->
    if field_Id and data[field_Id]
      return data[field_Id].split_Lines()
    result []

module.exports = Gdpr_Task