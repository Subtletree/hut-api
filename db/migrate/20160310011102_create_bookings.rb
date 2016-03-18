class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :booking_type, null: false
      t.integer :hut_id, foreign_key: true
      t.belongs_to :intention, foreign_key: true
      t.string :comment
      t.date :date, null: false

      t.timestamps
    end
  end
end
