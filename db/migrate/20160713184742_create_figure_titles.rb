class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |col|
      col.integer :title_id
      col.integer :figure_id
    end
  end
end
