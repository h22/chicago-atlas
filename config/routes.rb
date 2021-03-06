ChicagoAtlas::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # primary routes
  match 'place/:slug' => 'geography#show'
  get "places" => 'geography#index'
  match 'place/:geo_slug/resources(/:dataset_slug)' => 'geography#resources'
  match 'place/:geo_slug/:dataset_slug' => 'geography#showdataset'

  # static
  match 'map(/:dataset_slug)' => 'home#map'
  get "about" => 'home#about'
  get "partners" => 'home#partners'
  get "partner_sign_up" => 'home#partner_sign_up'

  # json
  match "resources(/:dataset_id)/:north/:east/:south/:west" => 'dataset#resources'

  # errors
  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end

  # root
  root :to => 'home#index'

end
