class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.decimal :price, precision: 18, scale: 2
      t.integer :age
      t.float :weight
      t.date :date_of_birth
      t.datetime :adopted_at
      t.time :wakeup_time
      t.boolean :desexed
      t.text :description

      t.timestamps
    end
  end
end
