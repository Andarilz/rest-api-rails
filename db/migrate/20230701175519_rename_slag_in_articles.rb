class RenameSlagInArticles < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :slag, :slug
  end
end
