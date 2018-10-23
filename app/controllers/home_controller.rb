class HomeController < ApplicationController

  before_action :move_to_root, only: [:bookmark, :unbookmark]

  def index
    @allnews = News.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def indexbookmark
    @allnews = News.all.order(bookmark: :desc).page(params[:page]).per(20)
  end

  def indexcomment
    @allnews = News.all.order(comment: :desc).page(params[:page]).per(20)
  end


  def taglist
    @tag1lists = Tag.where(sort: "電池").order(hiragana: :asc)
    @tag2lists = Tag.where(sort: "半導体").order(hiragana: :asc)
    @tag3lists = Tag.where(sort: "自動運転").order(hiragana: :asc)
    @tag4lists = Tag.where(sort: "AI・人工知能").order(hiragana: :asc)
    @tag5lists = Tag.where(sort: "企業").order(hiragana: :asc)
  end



  def show
    @newcomment = Comment.new
    @news = News.find(params[:id])
    @comments = Comment.where(news_id: params[:id]).order(created_at: :desc)
  end

  def search
    @results = News.where('tag LIKE(?)', "%#{params[:searchword]}%")
  end

  def wordsearch
    if params[:wordsearch].empty?
      redirect_to home_blank_path
    else
      @results = News.where('name LIKE(?)', "%#{params[:wordsearch]}%")
    end
  end

  def bookmark
    Bookmark.create(user_id: current_user.id, news_id: params[:home_id])
    news = News.find(params[:home_id])
    pluscount = news.bookmark + 1
    news.update(bookmark: pluscount)

    @news = News.find(params[:home_id])

    respond_to do |format|

      format.html {redirect_to "/home/#{params[:home_id]}"}
      format.js

    end
  end

  def unbookmark
    bookmark = Bookmark.find_by(user_id: current_user.id, news_id: params[:home_id])
    bookmark.destroy
    news = News.find(params[:home_id])
    minuscount = news.bookmark - 1
    news.update(bookmark: minuscount)

    @news = News.find(params[:home_id])

    respond_to do |format|

      format.html {redirect_to "/home/#{params[:home_id]}"}
      format.js

    end
  end


  private

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

end
