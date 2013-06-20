class AddContactToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contact, :string
  end
end
