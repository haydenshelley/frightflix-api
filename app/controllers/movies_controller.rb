class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render :index
  end

  def liked
    @user = current_user
    if @user
      @movies = @user.movies
      render :index
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end

  def add_liked
    UserMovie.create!(
      user_id: current_user.id,
      movie_id: params[:movie_id]
    )
    render json: {message: "Movie liked"}
  end

  def delete_liked
    @user_movie = UserMovie.find_by(user_id: current_user.id, movie_id: params[:movie_id])

    if @user_movie
      @user_movie.destroy
      render json: { message: "Movie unliked" }
    else
      render json: { error: "Movie not found in user's liked movies" }, status: :not_found
    end
  end

  def random_three
    @movies = []
    @categories = Category.where(id: [1, 2, 3])

    @categories.each do |category|
      cat_movies = category.movies
      if cat_movies.any?
        @movies << cat_movies.sample
      end
    end

    if @movies.any?
      render :index
    else
      render json: { message: "No movies found in the specified categories" }
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    title = @movie.title.gsub(" ","+")
    api_key = Rails.application.credentials.omdb
    response = HTTP.get("https://www.omdbapi.com/?t=#{title}&apikey=#{api_key}")
    render json: response.parse(:json)
  end

  def show_by_category
    @category = Category.find_by(name: params[:category_name])

    if @category
      @movies = @category.movies
      if @movies.any?
        render :index
      end
    else
      render json: { message: "Category not found" }
    end
  end

  def random
    @category = Category.find_by(name: params[:category_name])

    if @category
      @movies = @category.movies
      if @movies.any?
        @movie = @movies.sample
        render :show
      end
    else
      render json: { message: "Category not found" }
    end
  end

end
