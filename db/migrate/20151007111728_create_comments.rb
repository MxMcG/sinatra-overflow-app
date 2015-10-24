class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :answer_id
      t.string :content, null:false
      t.integer :user_id, null:false

      t.timestamps
    end
  end
end
