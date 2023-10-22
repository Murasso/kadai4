class BooksController < ApplicationController
  def index
    @books=Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  def show
    @book = Book.find(params[:id])
  end

  def edit
     @book =Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  def update
    book =Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id) #ユーザーの詳細ページへのパス  
  end
  
  private


  def book_params
    params.require(:book).permit(:title, :body)
  end
end
