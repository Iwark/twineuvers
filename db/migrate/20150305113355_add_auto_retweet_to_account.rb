class AddAutoRetweetToAccount < ActiveRecord::Migration[4.2]
  def change
    add_column :accounts, :auto_retweet, :boolean, default: true
  end
end
