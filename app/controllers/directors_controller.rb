
class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def show
    @director = Director.find(params[:id])
  end

  def create
    director = Director.new(director_params)
    if director.save
      redirect_to "/directors/#{director.id}"
    else
      render :new
    end
  end

  private

  def director_params
    params.require(:director).permit(:name)
  end
end
