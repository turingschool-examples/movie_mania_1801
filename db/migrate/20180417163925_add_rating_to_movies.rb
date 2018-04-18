class AddRatingToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :rating, :integer, default: 3
  end
end
