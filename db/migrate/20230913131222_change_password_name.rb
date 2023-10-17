class ChangePasswordName < ActiveRecord::Migration[7.0]

  def change
    rename_column :users, :encrypted_password, :password_digest
  end

end
