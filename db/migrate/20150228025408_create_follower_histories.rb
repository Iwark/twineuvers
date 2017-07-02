class CreateFollowerHistories < ActiveRecord::Migration[4.2]
  def change
    create_table :follower_histories do |t|
      t.references :account, index: true
      t.string :followers_count

      t.timestamps null: false
    end
    add_foreign_key :follower_histories, :accounts
  end
end
