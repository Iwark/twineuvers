class AddConsumerKeysToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :consumer_key, :string
    add_column :accounts, :consumer_secret, :string
  end
end
