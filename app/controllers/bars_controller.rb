class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]

  def index
    @bars = Bar.all
  end

  def show
  end


  def create
    @bar = Bar.new(bar_params)

      if @bar.save
        render :show, status: :created, location: @bar 
      else
        render json: @bar.errors, status: :unprocessable_entity
      end
    end
  end


  def update
    @bar = Bar.find(params[:id]) 

    if @bar.update(bar_params)
        head :no_content
      else
        render json: @bar.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @bar.destroy
    head :no_content 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_params
      params.require(:bar).permit(:name)
    end
end
