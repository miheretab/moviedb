class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :rate]
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @categories_count = Hash[Movie.group(:category).count.sort_by {|_key, value| value}.reverse]
    @ratings_count = Movie.group("Round(average_rating)").count
    @movies = Movie.search(params).paginate(:page => params[:page], :per_page => 2)

    respond_to do |format|
      format.html
      format.json { render :json => @movies }
    end
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.create(movie_params)

    if @movie.save
      flash[:notice] = "Movie was successfully created."
      redirect_to movies_url
    else
      flash.now[:error] = "Movie couldn't be created."
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
        flash[:notice] = "Movie was successfully updated."
        redirect_to movies_url
      else
        flash[:notice] = "Movie couldn't be updated."
        render :edit
      end
  end

  def rate
    @rate = UserRating.create({user: current_user, movie: @movie, rate: params[:rate]});
    @rate.save
    respond_to do |format|
      format.json { render :json => @movie }
    end
  end

  def destroy
    @movie.destroy
    flash[:notice] = "Movie was successfully destroyed."
    redirect_to movies_url
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :text, :category, :user_id)
    end
end
