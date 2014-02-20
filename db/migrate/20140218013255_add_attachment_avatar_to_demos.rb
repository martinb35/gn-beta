class AddAttachmentAvatarToDemos < ActiveRecord::Migration
  def self.up
    change_table :demos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :demos, :avatar
  end
end
