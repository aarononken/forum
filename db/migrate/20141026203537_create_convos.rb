class CreateConvos < ActiveRecord::Migration
  def change
    create_table :convos do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
