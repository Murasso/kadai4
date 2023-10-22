class CreateBooks < ActiveRecord::Migration[6.1]
  def change
   create_table :books, :id => false do |t|
      t.integer :id, :primary_key => true
      t.string :title
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end
end
