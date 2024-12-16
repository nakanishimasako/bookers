class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    # 3. フラッシュメッセージを定義
      flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else 
    render :edit
    end
  end

  def create
    @books = Book.all
    @book = Book.new
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      @book = book
      render :index
      end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # Book was successfully deleted.へリダイレクト 
  end

  def book_params
    params.require(:book).permit(:title, :body)
end
end
