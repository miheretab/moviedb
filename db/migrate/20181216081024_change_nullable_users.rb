class ChangeNullableUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :reset_password_token, :string, :null => true
    change_column :users, :reset_password_sent_at, :string, :null => true
    change_column :users, :remember_created_at, :string, :null => true
    change_column :users, :current_sign_in_at, :string, :null => true
    change_column :users, :last_sign_in_at, :string, :null => true
    change_column :users, :current_sign_in_ip, :string, :null => true
    change_column :users, :last_sign_in_ip, :string, :null => true
  end
end
