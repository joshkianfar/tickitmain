class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :description
      t.integer :sell_goal
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
