class CreateJobCategories < ActiveRecord::Migration
  def change
    create_table :job_categories do |t|
      t.string :title
      t.string :icon

      t.timestamps
    end
  end
end
