class Comment < ApplicationRecord

  validates :user_name, presence: true
  validates :news_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true, length: {maximum: 1000}
  belongs_to :news
  belongs_to :user

  #コメントしているかどうかの判定
  def commented?(id)
    user_id == id
  end

end
