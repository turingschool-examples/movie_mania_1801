#
#
class ActorsController < ApplicationController
  def new
    @actor = Actor.new
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def create
    actor = Actor.new(actor_params)
    if actor.save
      redirect_to "/actors/#{actor.id}"
    else
      render :new
    end
  end

  private

  def actor_params
    params.require(:actor).permit(:name)
  end
end
