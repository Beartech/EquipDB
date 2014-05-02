EquipDB::Application.routes.draw do


  resources :dev_logs

  get 'oauths/oauth'
  get 'oauths/callback'

  get 'parts/inventory_levels'  => 'parts#inventory_levels'
  get 'repairs' => 'repairs#index'
  get 'services' => 'services#index'

  get 'tools/tool_report' => 'tools#tool_report'

  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  resources :tools do
    resources :services
    resources :repairs
  end


  resources :parts
  resources :service_types

  root :to => "dashboard#dashboard"
  post 'services' => 'services#create'
  post 'repairs' => 'repairs#create'

  get 'user_admin' => 'admin/roles#index'

  resources :reports

  get 'drop_down_menus' => 'dropdown#index'
  put 'update_categories' => 'dropdown#update_categories'
  put 'update_stations' => 'dropdown#update_stations'
  put 'update_apparatus' => 'dropdown#update_apparatus'
  #patch 'edit_drop_down_menus' => 'dropdown'

  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  post 'toggle_in_service' => 'tools#toggle_in_service'

  get 'location/:app' => 'apparatus#index', :as => :apparatus_index
  post 'location/:app' => 'apparatus#update', :as => :tool_location_update

  get 'new_inventory' => 'inventories#new'
  post 'new_inventory' => 'inventories#create'
  post 'adjust_inventory' => 'inventories#adjust_inventory'

  get 'new_part_alias' => 'part_aliases#new'
  post 'new_part_alias' => 'part_aliases#create'

  get 'consume_inventory' => 'inventories#consume'
  post 'consume_inventory' => 'inventories#adjust_inventory'

  post 'get_default_parts' => 'service_types#get_default_parts'
  post 'part_lookup' => 'parts#part_lookup'
end
