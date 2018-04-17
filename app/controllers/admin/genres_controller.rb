# Admin genre controller
class Admin::GenresController < Admin::BaseController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "#{@genre.name} added successfully!"
      redirect_to genres_path
    else
      flash[:error] = 'There was an error saving that genre.'
      render :'genres/index'
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end