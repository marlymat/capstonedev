class FoosController < ApplicationController
  before_action :set_foo, only: [:show, :edit, :update, :destroy]

  def index
    @foos = Foo.all
  end

    
  def show
  end


  def create
    @foo = Foo.new(foo_params)
      
    if @foo.save
        render :show, status: :created, location: @foo
    else
        render json: @foo.errors, status: :unprocessable_entity
    end
  end


  def update
    @foo = Foo.find(params[:id])  
      
    if @foo.update(foo_params)
        head :no_content
    else
        render json: @foo.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @foo.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foo
      @foo = Foo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foo_params
      params.require(:foo).permit(:name)
    end
end
