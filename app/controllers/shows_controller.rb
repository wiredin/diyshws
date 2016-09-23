class ShowsController < ApplicationController

  def new
    @show = Show.new(city_id: params[:city_id])
    3.times { @show.bands.build }
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to @show.city 
    else
      3.times { @show.bands.build() }
      render 'new'
    end
  end
  
  private 

  def show_params
    params.require(:show).permit(:start_datetime, :venue, :facebook_event,:city_id, bands_attributes: [:id, :name, :country])

  end

end
