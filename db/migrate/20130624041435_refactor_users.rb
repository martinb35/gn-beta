class RefactorUsers < ActiveRecord::Migration
  def change
    drop_table :users
    
    create_table :users do |t|
      t.string    :name,                :null => false, :default => ''
      t.string    :email,               :null => false
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip                                           

      t.timestamps
    end
  end
end
