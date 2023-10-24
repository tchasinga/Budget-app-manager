class CreateCategoryExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :category_exchanges do |t|
      t.references :group, null: false, foreign_key: true
      t.references :exchange, null: false, foreign_key: true

      t.timestamps
    end
  end
end
