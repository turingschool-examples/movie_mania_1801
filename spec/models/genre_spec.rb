require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  describe 'relationships' do
    it { is_expected.to have_many(:movie_genres) }
    it { is_expected.to have_many(:movies).through(:movie_genres) }
  end

  describe 'Instance Methods' do
    context '#avg_rating' do
      it 'should calculate the average rating of movies in this genre' do
        genre = create(:genre)
        movies = create_list(:movie, 8)

        movies.each_with_index do |movie, index|
          if index < 5
            movie.genres.push(genre)
            movie.rating = index + 1
          else
            movie.rating = rand(1..5)
          end
          movie.save!
        end

        expect(genre.avg_rating).to be(3.0)
      end
    end
  end
end