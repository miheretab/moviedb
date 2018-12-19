class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :rate]
  before_action :authenticate_user!, :except => [:index, :show]

  # GET /movies
  # GET /movies.json
  def index
    @categories_count = Hash[Movie.group(:category).count.sort_by {|_key, value| value}.reverse]
    @ratings_count = Movie.group("Round(average_rating)").count
    @movies = Movie.search(params).paginate(:page => params[:page], :per_page => 2)

    respond_to do |format|
      format.html
      format.json { render :json => @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.create(movie_params)

    if @movie.save
      flash[:notice] = "Movie was successfully created."
      respond_to do |format|
        format.html { redirect_to movies_url }
        format.json { head :no_content }
      end
    else
      flash.now[:error] = "Movie couldn't be created."
      respond_to do |format|
        format.html { render :nds }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    if @movie.update(movie_params)
        flash[:notice] = "Movie was successfully updated."
        respond_to do |format|
          format.html { redirect_to movies_url }
          format.json { head :no_content }
        end
      else
        flash[:notice] = "Movie couldn't be updated."
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
  end

  # POST /movies/1/do_rate.json
  def do_rate
    @rating = UserRating.create({user: current_user, movie: @movie, rate: params[:rate]});
    @rating.save
    respond_to do |format|
      format.json { render :json => @movie }
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    flash[:notice] = "Movie was successfully destroyed."
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :text, :category, :user_id)
    end
end
