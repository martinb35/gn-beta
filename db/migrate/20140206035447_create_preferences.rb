class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :user, index: true
      t.belongs_to :notification_category, index: true
      t.boolean :check

      t.timestamps
    end
  end
end
