class CreateIntentions < ActiveRecord::Migration[5.0]
  def change
    create_table :intentions do |t|
      t.string :name, null: false
      t.belongs_to :user, foreign_key: true
      t.text :participants, array: true, default: []
      t.integer :number_of_participants, null: false
      t.string :emergency_name, null: false
      t.string :emergency_number, null: false

      t.timestamps
    end
  end
end
