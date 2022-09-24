class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    genre = Genre.new(genre_params)
      # 3. データをデータベースに保存するためのsaveメソッド実行
    genre.save
      # 4. トップ画面へリダイレクト
    redirect_to admin_genres_path
  end
  
  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
 
end
