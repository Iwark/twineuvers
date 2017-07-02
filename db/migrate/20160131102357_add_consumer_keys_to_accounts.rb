class AddConsumerKeysToAccounts < ActiveRecord::Migration[4.2]
  def change
    add_column :accounts, :consumer_key, :string
    add_column :accounts, :consumer_secret, :string
  end
end
