class AddAutoDirectMessageToAccounts < ActiveRecord::Migration[4.2]
  def change
    add_column :accounts, :auto_direct_message, :boolean, default: true
  end
end
