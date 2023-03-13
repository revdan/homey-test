class CreateHistoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :history_items do |t|
      t.belongs_to :project
      t.string :type
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
