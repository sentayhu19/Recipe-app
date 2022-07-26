class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :measurement_unit
      t.decimal :price
      t.integer :quantity
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
