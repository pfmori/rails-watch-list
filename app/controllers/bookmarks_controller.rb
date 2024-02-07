class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  # before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = @list.bookmarks.build
    @bookmark.movie_id = params[:movie_id]
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully destroyed.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie, :comment)
  end
end
