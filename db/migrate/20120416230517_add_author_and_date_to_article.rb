class AddAuthorAndDateToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :author, :string
    add_column :articles, :publish_at, :datetime
  end
end
