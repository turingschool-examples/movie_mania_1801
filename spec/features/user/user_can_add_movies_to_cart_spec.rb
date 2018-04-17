require "rails_helper"

describe "add movie to cart" do
  context "user visits movies index" do
    it "should be able to add movie to cart" do
      director = Director.create!(name: "Someone!")
      movie = director.movies.create!(title: "Shawshank Redemption", description: "Tim Robbins in jail")

      visit movies_path

      click_on "Add Movie"

      expect(current_path).to eq(movies_path)
      expect(page).to have_content("You now have 1 #{movie.title} in your cart.")
    end

    it "adds multiple of the same movie to the cart" do
      director = Director.create!(name: "Someone!")
      movie = director.movies.create!(title: "Shawshank Redemption", description: "Tim Robbins in jail")

      visit movies_path

      click_on "Add Movie"

      expect(page).to have_content("You now have 1 #{movie.title} in your cart.")

      click_on "Add Movie"

      expect(page).to have_content("You now have 2 #{movie.title}s in your cart.")
    end

    it "displays total number of items in cart" do
      director = Director.create!(name: "Someone!")
      movie1 = director.movies.create!(title: "Shawshank Redemption", description: "Tim Robbins in jail")
      movie2 = director.movies.create!(title: "Mary Poppins", description: "Tim Robbins in jail")

      visit movies_path

      expect(page).to have_content("Cart: 0")

      within(".movie-#{movie1.id}") do
        click_on "Add Movie"
      end

      within(".movie-#{movie2.id}") do
        click_on "Add Movie"
      end


      expect(page).to have_content("You now have 1 #{movie2.title} in your cart.")
      expect(page).to have_content("Cart: 2")
    end
  end
end
