class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_many :posts
  has_many :comments
  has_many :comment_votes

  has_many :posts_commented_on, :through => :comments, :source => :post

  validates :email, :uniqueness => true
  validates :email, :format => /.+\@.+\..{2,6}/

  has_secure_password
end
