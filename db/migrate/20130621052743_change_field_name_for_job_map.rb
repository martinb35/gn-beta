class ChangeFieldNameForJobMap < ActiveRecord::Migration
  def change
    rename_column :jobs, :map, :latlong
  end
end
