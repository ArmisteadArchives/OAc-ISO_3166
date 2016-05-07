class CreateWikiCountrySubdivisions < ActiveRecord::Migration
  def change
    create_table :wiki_country_subdivisions do |t|
      t.references :country, index: true, foreign_key: true
      t.string :alpha
      t.string :native_name
      t.string :iso_name

      t.timestamps null: false
    end
  end
end
