class BookmarksController < ApplicationController

  def new          #this will display a form to create a new bookmark
  @list = List.find(params[:id])
  @bookmark = Bookmark.new
  end


  def create           # this will process the form and create a new bookmark
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)        # this will redirect to list path , if not will render again the process form
    else
      render :new
    end
   end

   def destroy
   @bookmark =Bookmark.find(paramas[:id])  #find what bookmark to delete by id
   @bookmark.destroy
   redirect_to list_path(@bookmark.list)  #after is destroyed user will be send to bookmark list   ( we may need to put a if satement to render again  if is not working )
   end

   private

   def bookmark_params
   paramas_required(:bookmark).permit(:comment, :movie_id)    #this action will require in the bookmark parameters  and is permited only for comment and movie id 
   end













end
