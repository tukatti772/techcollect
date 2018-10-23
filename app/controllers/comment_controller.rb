class CommentController < ApplicationController

  before_action :move_to_root


  def create
    @newcomment = Comment.new(commentparams)

    respond_to do |format|

      if @newcomment.save

        news = News.find(params[:home_id])
        pluscount = news.comment + 1
        news.update(comment: pluscount)

        @comments = Comment.where(news_id: params[:home_id]).order(created_at: :desc)
        @news = News.find(params[:home_id])

        format.html {redirect_to "/home/#{params[:home_id]}"}
        format.js

      else

        @news = News.find(params[:home_id])
        @comments = Comment.where(news_id: params[:home_id]).order(created_at: :desc)

        format.html {render "home/show"}
        format.js

      end

    end

  end


  #コメントの削除
  def destroy
    comment = Comment.find(params[:id])
    minuscount = comment.news.comment - 1
    id = comment.news.id

    comment.news.update(comment: minuscount)
    comment.destroy

    @comments = Comment.where(news_id: id).order(created_at: :desc)
    @news = News.find(id)

    respond_to do |format|

      format.html {redirect_to "/home/#{id}"}
      format.js

    end

  end


private

#require(:xxx)とつけることで、[:xxx][:text]..のような形のハッシュを受けられる

  def commentparams
    params.require(:comment).permit(:comment).merge(user_name: current_user.nickname, news_id: params[:home_id], user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path  unless user_signed_in?
  end

end
