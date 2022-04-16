class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id]) #book_idに該当するレコードを取得
    comment = BookComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: book_path(book))
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_back(fallback_location: books_path)
  end

  private

  def post_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
