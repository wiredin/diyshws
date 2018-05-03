class ShowsController < ApplicationController
  layout "cities"
  
  def new
    @city = City.find(params[:city_id])
    @show = Show.new(city_id: @city.id)
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

  def edit
    @city = City.find(params[:city_id])
    @show = Show.find(params[:id])
  end

  def update
    @city = City.find(params[:city_id])
    @show = Show.find(params[:id])
    if @show.update_attributes(show_params)
      flash[:sucess] = "Show update"
      redirect_to @show.city 
    else
      render 'edit'
    end
  end
  
  private 

  def show_params
    params.require(:show).permit(:start_date, :start_time, :venue, :facebook_event, :city_id, performances_attributes: [:id, :position, band_attributes: [:id, :name, :state, :country, :bandcamp]])
  end

end
