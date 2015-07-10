class User < ActiveRecord::Base
  paginates_per 6

  validates :name, presence:true
  validates :username, presence:true
end