class MoviesController < ApplicationController

  def index             #the index action is used to display all the movies
    @movies =Movies.all
  end

  def show     #the show action is used to display a single movie , that s why we put id
    @movie - Movie.find(params[:id])
  end

  def new     # the new action is used to display a form when you want to create a new movie
    @movie = Movie.new
  end

  def create     # create action is used to process form submition and create a new movie
   @movie = Movie.new(movie_params)
   if @movie.save
    redirect_to @movie
   else
    render :new
   end
  end

  def edit         # edit action is used to display a form to edit an existing movie ..... find by params id to look for the movie
  @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])  # we find the movie we want to update by id
    if @movie.update(movie_params)   # if the update was ok we redirect the user to the show page of the updated movie
      redirect_to @movie
    else
      render :edit              # if the update failed  we render the edit template again until is completed correct
    end
  end

  def destroy
    @movie =Movie.find(paramas[:id])      # the destroy action is used to delete a movie
    @movie.destroy
    redirect_to movies_path
  end

  private
 def movie_params

  # we want just those atribute to be updated or created
  

  params.require(:movie).permit(:title, :overview, :poster_url, :rating)
 end

end
