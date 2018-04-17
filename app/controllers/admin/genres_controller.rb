class Admin::GenresController < Admin::BaseController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "#{@genre.name} created successfully!"
      redirect_to admin_genres_path
    else
      flash[:failure] = "Genre could not be created. Please try again!"
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
