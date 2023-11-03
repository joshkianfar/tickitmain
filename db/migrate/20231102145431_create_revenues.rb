class CreateRevenues < ActiveRecord::Migration[7.1]
  def change
    create_table :revenues do |t|
      t.decimal :amount
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
