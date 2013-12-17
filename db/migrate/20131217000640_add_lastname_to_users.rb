class AddLastnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastname, :string
    add_column :users, :calle, :string
    add_column :users, :cp, :string
    add_column :users, :colonia, :string
    add_column :users, :ciudad, :string
    add_column :users, :phone, :string
    add_column :users, :birthdate, :string
    add_column :users, :gender, :string
    add_column :users, :prefer, :string
  end
end
