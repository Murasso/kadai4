class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @books=Book.all
    @book=Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books=Book.all
    if @book.save
      flash[:notice] = "Article was created successfully"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Failed to save article"
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
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
    @book =Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id) 
    else
      render :edit
    end
  end
  
  private


  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    book=Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
