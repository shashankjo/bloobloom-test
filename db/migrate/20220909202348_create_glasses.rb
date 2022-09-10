class CreateGlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :glasses do |t|
      t.references :frame
      t.references :len
      t.references :user
      t.timestamps
    end
  end
end
