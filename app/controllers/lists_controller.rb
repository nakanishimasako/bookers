class listsController < ApplicationController
  def new
    @book = book.new
  end

  def index
    @books = book.all
  end

  def show
    @book = book.find(params[:id])  
  end

  def edit
    @book = book.find(params[:id])
  end

  def update
    book = book.find(params[:id])
    book.update(book_params)
    
  end

  def create
    book=book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

    def book_params
      params.permit(:title, :body)
  end

  def destroy
    book = book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # Book was successfully created.へリダイレクト 
  end

  private
end