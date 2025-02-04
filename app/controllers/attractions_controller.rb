class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end
  
  def show
    @user = User.find_by_id(session[:user_id])
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
  end

  def index
    @user = User.find_by(id: session[:user_id])
    @attractions = Attraction.all
  end

  def edit
    @attraction = Attraction.find_by(id: session[:user_id])
  end

  def update
    attraction = Attraction.find_by(id: session[:user_id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end
