class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps null: false
     end
  end
end

