class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :content, null:false
      t.integer :user_id, null:false

      t.timestamps
    end
  end
end
