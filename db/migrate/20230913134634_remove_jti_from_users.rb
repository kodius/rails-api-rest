class RemoveJtiFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :jti
    add_column :users, :valid_jwt_token, :string, default: nil
  end
end
