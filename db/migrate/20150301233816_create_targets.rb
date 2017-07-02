class CreateTargets < ActiveRecord::Migration[4.2]
  def change
    create_table :targets do |t|
      t.string :name
      t.string :screen_name

      t.timestamps null: false
    end
  end
end
