class AddDatesToIntention < ActiveRecord::Migration[5.0]
  def change
    add_column :intentions, :start_date, :date
    add_column :intentions, :end_date, :date

    Intention.update_all(start_date: Time.zone.today)
    Intention.update_all(end_date: Time.zone.today)

    change_column_null :intentions, :start_date, false
    change_column_null :intentions, :end_date, false
  end
end
