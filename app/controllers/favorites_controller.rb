class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id]) #該当するbook_idのレコードをBookモデルから持ってくる
    favorite = current_user.favorites.new(book_id: @book.id)  #現在のユーザーに紐づく形でfavoritesモデルを新規作成 favoritesモデルのbook_idカラムにbook.idを格納
    favorite.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id) #現在のユーザーのfavoritesモデルからbook.idに一致するbook_idが存在するレコードを格納する
    favorite.destroy
  end
end
