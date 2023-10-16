class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render :index
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    render :show
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
end
