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

  def country_display(band_fields)
    if(!band_fields.object.international)
      "hide"      
    end 
  end

  def state_display(band_fields)
    if(band_fields.object.international)
      "hide"
    end 
  end

  def format_bands_form_params(bands)
    bands.map do |b|
      state =  (b.country == "USA" || b.country == "") ? b.state : b.country
      {name: b.name, id: b.id, state: state, bandcamp: b.bandcamp, soundcloud: nil}
    end
  end


  def state_options
    states = 
    [
    ['Alabama', 'AL'],
    ['Alaska', 'AK'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['Delaware', 'DE'],
    ['District of Columbia', 'DC'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Hawaii', 'HI'],
    ['Idaho', 'ID'],
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Iowa', 'IA'],
    ['Kansas', 'KS'],
    ['Kentucky', 'KY'],
    ['Louisiana', 'LA'],
    ['Maine', 'ME'],
    ['Maryland', 'MD'],
    ['Massachusetts', 'MA'],
    ['Michigan', 'MI'],
    ['Minnesota', 'MN'],
    ['Mississippi', 'MS'],
    ['Missouri', 'MO'],
    ['Montana', 'MT'],
    ['Nebraska', 'NE'],
    ['Nevada', 'NV'],
    ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'],
    ['New Mexico', 'NM'],
    ['New York', 'NY'],
    ['North Carolina', 'NC'],
    ['North Dakota', 'ND'],
    ['Ohio', 'OH'],
    ['Oklahoma', 'OK'],
    ['Oregon', 'OR'],
    ['Pennsylvania', 'PA'],
    ['Puerto Rico', 'PR'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY']
  ]
  end
end
