class RidesController < ApplicationController

  def index
    
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(ride_params)
    @notice = @ride.take_ride
    redirect_to user_path(@ride.user), :notice => @notice
  end


  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end