EquipDB::Application.routes.draw do

  get "oauths/oauth"
  get "oauths/callback"

  get 'parts'  => 'parts#index'
  get 'repairs' => 'repairs#index'
  get 'services' => 'services#index'



  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  resources :tools do
    resources :services do
      resources :parts
    end
    resources :repairs do
      resources :parts
    end
  end

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

  post 'update_in_service' => 'tools#in_service'
  post 'update_out_service' => 'tools#out_service'
  get 'in_service => '
end
