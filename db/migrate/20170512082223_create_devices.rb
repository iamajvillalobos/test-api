class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :device_mac
      t.string :serial_no
      t.string :color
      t.string :name
      t.text :description
      t.string :building
      t.string :level
      t.integer :device_threshold

      t.timestamps
    end
  end
end
