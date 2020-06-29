class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :color, default: "#e6493e"

      t.timestamps
    end
  end
end
