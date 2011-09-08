class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :article_id
      t.integer :order
      t.text :data
      t.string :type

      t.timestamps
    end
  end
end
