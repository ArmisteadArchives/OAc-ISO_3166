class CreateWikiCountries < ActiveRecord::Migration
  def change
    create_table :wiki_countries do |t|
      t.string :alpha_2
      t.string :alpha_3
      t.integer :numeric
      t.string :iso_name
      t.integer :year_added
      t.string :domain

      t.timestamps null: false
    end
  end
end
