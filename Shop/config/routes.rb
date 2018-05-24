Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'pages#home'

	get '/listPacks', to: 'packs#list'
	get '/listToys', to: 'toys#list'
	get '/listPieces', to: 'pieces#list'

	get '/toys/:id', to: 'toys#show', as: 'toy'
	get '/packs/:id', to: 'packs#show', as: 'pack'

	post '/addprod', to: 'cart#addprod'
end
