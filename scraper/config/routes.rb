Rails.application.routes.draw do
  namespace :wiki do
    resources :country_subdivisions
  end
  namespace :wiki do
    resources :countries
  end
  get 'wikiscraper' => 'wikiscraper#index'
  get 'wikiscraper/iso_3166_1_a2'
  get 'wikiscraper/iso_3166_1_a3'
  get 'wikiscraper/iso_3166_1_n'
  get 'wikiscraper/iso_3166_2'
  get 'wikiscraper/iso_3166_2_h'
  get 'wikiscraper/iso_3166_2/:ca2' => 'wikiscraper#iso_3166_2_c'
end
