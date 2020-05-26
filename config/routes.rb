Rails.application.routes.draw do
	root 'books#top'
	get '/home/about' => 'books#about'
  devise_for :users

  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
