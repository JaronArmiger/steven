class AddColorsToPost < ActiveRecord::Migration[6.0]
  def change
  	add_column :posts, :body_color, :string, default: "#ffffff"
  	add_column :posts, :font_color, :string, default: "#ffffff"
  end
end
