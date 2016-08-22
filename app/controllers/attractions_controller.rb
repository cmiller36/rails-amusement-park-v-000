class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:notice] = "Attraction was successfully created."
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @attraction.update(attraction_params)
    flash[:notice] = "Attraction was successfully updated."
    redirect_to attraction_path(@attraction)
  end

  private

  def set_attraction
      @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
  end

end