class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates :title, :presence => true
  validates :body, :presence => true

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  default_scope {order('created_at DESC')}
end
