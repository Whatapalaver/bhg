Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :games do
    resources :game_hands
  end
  get '/search' => 'games#search', :as => 'search_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'about', to: 'pages#about'
end
