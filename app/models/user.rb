class User < ActiveRecord::Base
  has_secure_password
  paginates_per 6

  validates :name, presence:true
  validates :username, presence:true, uniqueness: true
  validates :email, presence:true, uniqueness: true
  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create

  has_many :quotes_attributed, class_name: 'Quote', foreign_key: 'attributed_id'
  has_many :quotes_authored, class_name: 'Quote', foreign_key: 'author_id'

  has_and_belongs_to_many :roles
end