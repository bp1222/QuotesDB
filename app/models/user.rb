class User < ActiveRecord::Base
  has_secure_password
  paginates_per 6

  validates :name, presence:true
  validates :username, presence:true
  validates_presence_of :password, :on => :create

  has_many :quotes_attributed, class_name: 'Quote', foreign_key: 'attributed_id'
  has_many :quotes_authored, class_name: 'Quote', foreign_key: 'author_id'
end