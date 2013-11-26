class Post < ActiveRecord::Base
  attr_accessible :title, :motivation, :user_id, :song_id

  belongs_to :user
  belongs_to :song
  has_many :comments

def self.all_cached
  Rails.cache.fetch('Post.all', expires_in: 5.seconds) { all }
  p '-----Rails.cache------'
  p Rails.cache.read('Post.all')
  p '---------------'
end
end


