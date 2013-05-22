class AddFloorIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :floor_id, :integer
  end
end
