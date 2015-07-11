class Quote < ActiveRecord::Base
  paginates_per 6

  belongs_to :author, class_name: 'User'
  belongs_to :attributed, class_name: 'User'
end
