class AddTwitterOauthToSetting < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :twitter_consumer_key, :string
    add_column :settings, :twitter_consumer_secret, :string
  end
end
