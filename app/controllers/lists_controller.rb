class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_lists)
    @list.save
    redirect_to lists_path
  end

  private

  def params_lists
    params.require(:list).permit(:name, :photo)
  end
end
