class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  #set_movie is private method that loads in called index automatically
 
  def index
    @movies = Movie.all
  end
  
 def new
    @movie = Movie.new
  end
  
 def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end
  
 def show
   #before_action
 end
  
 def edit
   #before_action
 end
  
 def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end
  
 def destroy
    @movie.destroy
    redirect_to movies_path
  end
  
 private
  def movie_params
    params.require(:movie).permit(:title, :duration, :genre, :description, :trailer)
   
  end
  
 def set_movie
    @movie = Movie.find(params[:id])
  end
 end
 
