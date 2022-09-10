class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.decimal :dollar_conversion_rate
      t.timestamps
    end
  end
end
