class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.text :body
      t.integer :star

      t.timestamps
    end
  end
end
