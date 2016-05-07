class AddColumnToWikiCountrySubdivisions < ActiveRecord::Migration
  def change
    add_column :wiki_country_subdivisions, :native_transcription, :string
  end
end
