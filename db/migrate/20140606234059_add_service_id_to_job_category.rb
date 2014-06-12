class AddServiceIdToJobCategory < ActiveRecord::Migration
  def change
    add_column :job_categories, :service_id, :integer
  end
end
