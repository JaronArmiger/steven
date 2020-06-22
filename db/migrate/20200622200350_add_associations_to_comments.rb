class AddAssociationsToComments < ActiveRecord::Migration[6.0]
  def change
  	add_column :comments, :commentable_id, :integer
  	add_column :comments, :commentable_type, :string

  	change_column_null :comments, :commentable_id, false
  	change_column_null :comments, :commentable_type, false
  end
end
