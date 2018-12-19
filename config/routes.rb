Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'

  resources :movies
  get 'movies/:id/rate', to: 'movies#do_rate', :as => "movie_rate"
end
