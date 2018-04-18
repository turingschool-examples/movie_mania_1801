class AddMovieGenreColumnToMovies < ActiveRecord::Migration[5.1]
  def change
    add_reference :movies, :movie_genre, foreign_key: true
  end
end
