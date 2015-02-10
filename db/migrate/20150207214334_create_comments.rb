class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :producer, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :producers
  end
end
