class ListsController < ApplicationController

  def index
    @list = List.all     #index action is used to display all the lists in our projects
  end

  def show
  @list = List.find(params[:id])   # we can look for a single list in our project
  end

  def new
    @list =List.new  # this action will be used to display a form to create a new list
  end

  def create
  @list =List.new(list_params)     #this action will process the creation of a new form
  if list.save                     #if is save user will be redirected to the  list page
    redirect_to @list               # if not will render the page again until all the parameters are filled properly
  else
    render :new
   end
  end

  def destroy    # this will delete and existing list
  @list = List.find(paramas[:id])
  @list.destroy
  redirect_to lists_path
  end

  private

  def list_params
  params.require(:list).permit(:name)    #this require a name in the list 
  end

end
