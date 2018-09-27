class WorkdaySerializer


  def initialize(args = {})
  end

  def workdays data
    worked_days = []
    data["workdays"].each do |worked_day|
      workday_data = worked_day["data"].map { |workday|
        workday_object(workday)
      }
      worked_days.append(worked_day_object(worked_day, workday_data))
    end
    return worked_days, data["report_time"]
  end


  private

  def worked_day_object params, data
    worked_day = OpenStruct.new(day: params["day_of_week"], data: data)
  end

  def workday_object params
    workday = OpenStruct.new(status: params["status"], time: params["time"])
  end
end