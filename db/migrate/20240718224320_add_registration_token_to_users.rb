class AddRegistrationTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :registration_token, :string
  end
end
