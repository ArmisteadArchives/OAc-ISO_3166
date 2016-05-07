json.array!(@wiki_countries) do |wiki_country|
  json.extract! wiki_country, :id, :alpha_2, :alpha_3, :numeric, :iso_name, :year_added, :domain
  json.url wiki_country_url(wiki_country, format: :json)
end
