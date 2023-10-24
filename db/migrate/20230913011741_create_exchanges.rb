class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.decimal :amount
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
