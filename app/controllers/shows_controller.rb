class ShowsController < ApplicationController
  layout "cities"
  
  def new
    @city = City.find(params[:city_id])
    @show = Show.new(city_id: @city.id)
    3.times { @show.bands.build }
  end

  def create
    @city = City.find(params[:city_id])
    @show = Show.new(show_params)
    if @show.save
      redirect_to @show.city 
    else
      render 'new'
    end
  end
  
  private 

  def show_params
    params.require(:show).permit(:start_date, :start_time, :venue, :facebook_event,:city_id, bands_attributes: [:id, :name, :country])
  end

end
