class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.datetime :start_on
      t.datetime :end_on
      t.timestamps
    end
  end
end
