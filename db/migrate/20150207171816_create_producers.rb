class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :name
      t.text :text

      t.timestamps null: false
    end
  end
end
