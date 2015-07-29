class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find_by(id: params[:id])
    @user = User.find_by(id: @bookmark.user_id)
  end

  def new
    @userId = params[:id]
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.name = params[:name]
    @bookmark.url = params[:url]
    @bookmark.description = params[:description]
    @bookmark.user_id = params[:user_id]
    
    @user = User.find_by(id: @bookmark.user_id)

    if (@user != nil)
      if @bookmark.save
        redirect_to "/bookmarks/#{ @bookmark.id }"
      else
        render 'new'
      end
    else
      render "new"
    end
  end

  def edit
    @bookmark = Bookmark.find_by(id: params[:id])
  end

  def update
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.name = params[:name]
    @bookmark.url = params[:url]
    @bookmark.description = params[:description]
    @bookmark.user_id = params[:user_id]
    
    @user = User.find_by(id: @bookmark.user_id)

    if (@user != nil)
      if @bookmark.save
        redirect_to "/bookmarks/#{ @bookmark.id }"
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.destroy


    redirect_to "/bookmarks"
  end
end
