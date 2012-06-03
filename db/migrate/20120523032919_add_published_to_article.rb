class AddPublishedToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :visible, :boolean
  end
end
