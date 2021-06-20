class Appointment < ActiveRecord::Base
  def get_data
    {
        "title": title,
        "id": id,
        "start": formatted_date(start_at),
        "end": formatted_date(end_at)
    }
  end

  def formatted_date(date)
    date.strftime('%Y-%m-%d %H:%M:%S')
  end
end
