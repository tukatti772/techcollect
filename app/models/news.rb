class News < ApplicationRecord
  validates :name,:text,:tag,:link,:bookmark,:quotation,:comment,  presence: true
  has_many :comments
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  #アソシエーションにより使えるようになるメソッド
  def bookmarkcheck(news_id,user_id)
    bookmarks.exists?(news_id: news_id, user_id: user_id)
  end


end
