class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :name
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
