class UsersController < ApplicationController

  before_action :move_to_root, only: [:bookmark,:comment]

  def show
    @user = User.find(params[:id])
  end

  def bookmark
    @bookmarks = current_user.news.order(created_at: :desc)
  end

  def comment
    comments = Comment.where(user_id: current_user.id)

    @commentednews = []

    comments.each do |comment|
      @commentednews << News.find(comment.news_id)
    end

    #ユーザーがコメントしたニューズ一覧から、重複を削除
    @commentednews.uniq!

    #created_atの降順で並び替え。モデルの後ろに直接書くorderメソッドは使えない。
    @commentednews.sort! do |a,b|
      b[:created_at] <=> a[:created_at]
    end


  end



  private

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

end
