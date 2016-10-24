module ShowsHelper
  def time_options
    i = 0
    times = Array.new
    for n in 1..24 
      sub = n > 12 ? 12 : 0
      period = sub == 0 ? 'am' : 'pm'
      times[i] = ["#{n-sub}:00 #{period}","#{n}:00"]
      i = i + 1
      times[i] = ["#{n-sub}:30 #{period}","#{n}:30"]
      i = i + 1  
    end
    times
  end
end
