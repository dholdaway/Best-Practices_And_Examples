#!/usr/bin/env coffee
require 'fluentnode'

Save_Data = require '../src/jira/save-Data'

save_Data = new Save_Data()


save_Project = (project, count, days)->
  if days
    console.log "Saving all issues in project #{project} changed in last #{count} day(s)"
    save_Data.save_Issues_In_Project_Last_N_Days project, count, (files)->
      console.log "Saved #{files.size()} files for project #{project}"
  else
    console.log "Saving all issues in project #{project} changed in last #{count} hours(s)"
    save_Data.save_Issues_In_Project_Last_N_Hours project, count, (files)->
      console.log "Saved #{files.size()} files for project #{project}"

count = 100
use_Days = true # vs hours
save_Project "GDPR", count, use_Days


