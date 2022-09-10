class CreateLens < ActiveRecord::Migration[6.1]
  def change
    create_table :lens do |t|
      t.string :color
      t.text :description
      t.string :prescription_type
      t.string :lens_type
      t.integer :stock
      t.decimal :price
      t.timestamps
    end
  end
end
