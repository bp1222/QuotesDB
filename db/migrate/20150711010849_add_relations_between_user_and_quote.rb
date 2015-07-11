class AddRelationsBetweenUserAndQuote < ActiveRecord::Migration
  def change
    add_reference :quotes, :attributed, index: true
    add_reference :quotes, :author, index: true
  end
end
