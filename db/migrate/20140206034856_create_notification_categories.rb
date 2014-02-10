class CreateNotificationCategories < ActiveRecord::Migration
  def change
    create_table :notification_categories do |t|
      t.string :notification
      t.string :category

      t.timestamps
    end
  end
end
