Rails.application.routes.draw do
	devise_for :users
	root 'books#top'
	resources :users
	resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  	get '/home/about' => 'books#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
