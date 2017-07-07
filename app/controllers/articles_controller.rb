class ArticlesController < ApplicationController
  def index
    render :text => "S/O to the homies Jim and Killa Mike!"
  end

  def create
  end

  def new
    render :html => "You are creating a new task"
  end

  def show
    render :html => "You are viewing task #{params[:id]}"
  end

  def edit
    render :html => "You are editing task #{params[:id]}"
  end

  def update
  end

  def destroy
  end
end
