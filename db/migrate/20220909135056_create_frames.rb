class CreateFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :frames do |t|
      t.string :name
      t.text :description
      t.string :status
      t.integer :stock
      t.decimal :price
      t.timestamps
    end
  end
end
