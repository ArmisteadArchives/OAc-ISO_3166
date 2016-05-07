json.array!(@wiki_country_subdivisions) do |wiki_country_subdivision|
  json.extract! wiki_country_subdivision, :id, :country_id, :alpha, :native_name, :iso_name
  json.url wiki_country_subdivision_url(wiki_country_subdivision, format: :json)
end
