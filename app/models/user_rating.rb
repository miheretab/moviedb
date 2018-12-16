class UserRating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  after_save do
    movie.update_attribute(:average_rating, movie.user_ratings.average("user_ratings.rate"))
  end
end
