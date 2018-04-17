module Admin
  class GenresController < BaseController
    def create
      genre = Genre.new(genre_params)
      if genre.save
        flash[:success] = 'Genre Created'
        redirect_to genres_path
      else
        flash[:danger] = 'Error. Genre not created'
        redirect_to genres_path
      end
    end

    private

    def genre_params
      params.require(:genre).permit(:name)
    end
  end
end
