class Post < ApplicationRecord
  acts_as_taggable
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :likes, dependent: :destroy

  validates :image, presence: true

  mount_uploader :image, ImageUploader
  # def like_by?(user) #ユーザーがいいねをしてあるかどうかを確認するための記述。いいねボタンを追記するmy_books/showページで後々使う。
  #   likes.where(user_id: user.id).exists?
  # end
end