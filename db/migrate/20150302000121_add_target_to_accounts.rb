class AddTargetToAccounts < ActiveRecord::Migration[4.2]
  def change
    remove_column :accounts, :target_user
    add_reference :accounts, :target, index: true
    add_foreign_key :accounts, :targets
  end
end
