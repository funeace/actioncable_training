class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :content
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
