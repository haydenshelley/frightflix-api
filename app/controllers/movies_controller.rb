class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render :index
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    title = @movie.title.gsub(" ","+")
    api_key = Rails.application.credentials.api_key[:omdb]
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
