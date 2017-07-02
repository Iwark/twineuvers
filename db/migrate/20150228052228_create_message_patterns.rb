class CreateMessagePatterns < ActiveRecord::Migration[4.2]
  def change
    create_table :message_patterns do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
