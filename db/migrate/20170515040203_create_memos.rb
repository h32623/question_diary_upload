class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|

      t.text :content
      t.integer :question_id
      t.string :image_url, :default => ""
      
      t.timestamps null: false
    end
  end
end
