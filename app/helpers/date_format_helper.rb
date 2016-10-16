module DateFormatHelper

  def print_time(t) 
    if t.min == 00
      t.strftime("%l%P")
    else
      t.strftime("%l:%M%P")
    end
  end


end
