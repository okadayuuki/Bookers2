Rails.application.routes.draw do
  get 'home/about'
  devise_for :users

  constraints -> request { request.session[:user].present? } do
  	root to:'books#index'
  end
  root to:'home#top'
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
