class ChangeDataTypeForJobNotes < ActiveRecord::Migration
  def change
    change_table :jobs do |t|  
      t.change :notes, :text 
    end
  end
end
