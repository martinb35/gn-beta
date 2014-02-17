class AddPreferToNotificationCategories < ActiveRecord::Migration
  def change
    add_column :notification_categories, :prefer, :string
  end
end
