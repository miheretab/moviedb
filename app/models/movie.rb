class Movie < ApplicationRecord
  enum category: { action: "action", drama: "drama", romace: "romance", scientific: "scientific" }
  belongs_to :user

  has_many :user_ratings

  validates :title, presence: true, uniqueness: true

  def self.search(params)
    movies = all
    movies = movies.where("lower(title) LIKE ?", "%#{params[:search].downcase}%").or(movies.where("lower(text) LIKE ?", "%#{params[:search].downcase}%")) if params[:search]
    movies = movies.where("category = ?", params[:category]) if params[:category]
    movies = movies.where("ROUND(average_rating) = ?", "#{params[:average_rating]}") if params[:average_rating]
    movies
  end
end
