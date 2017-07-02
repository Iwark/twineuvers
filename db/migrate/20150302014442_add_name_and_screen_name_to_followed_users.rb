class AddNameAndScreenNameToFollowedUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :followed_users, :name, :string
    add_column :followed_users, :screen_name, :string
  end
end
