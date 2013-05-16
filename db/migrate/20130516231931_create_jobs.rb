class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :level
      t.integer :floor
      t.integer :room
      t.integer :bathroom
      t.boolean :material
      t.string :notes
      t.string :address
      t.string :location_ref
      t.string :second_address
      t.integer :stored_address
      t.string :map
      t.datetime :when
      t.decimal :offer, scale: 2
      t.boolean :private
      t.boolean :auto_assign

      t.timestamps
    end
  end
end
