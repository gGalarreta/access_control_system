json.report_time @amount_time
json.workdays @workdays do |workday|
  json.day_of_week    workday["day_of_week"]
  json.data workday["data"]  do |worked_day|
    json.status     worked_day["status"]
    json.time       worked_day["time"]
  end
end