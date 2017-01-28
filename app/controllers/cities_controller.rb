class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all
  end

    
  def show
  end

     
  def create
    @city = City.new(city_params)

    if @city.save
        render :show, status: :created, location: @city 
    else
        render json: @city.errors, status: :unprocessable_entity 
    end
  end

    
  def update
    @city = City.find(params[:id])
      
    if @city.update(city_params)
        head :no_content
    else
        render json: @city.errors, status: :unprocessable_entity 
    end
  end

    
  def destroy
    @city.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:id, :name)
    end
end