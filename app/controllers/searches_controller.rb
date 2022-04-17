class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @target = params[:target]
    @word = params[:word]

    if @target == "User"
      @users = User.looks(params[:search],params[:word])
    else
      @books = Book.looks(params[:search],params[:word])
    end
  end
end
