Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get '/listToys', to: 'toys#list'
	get '/listPieces', to: 'pieces#list'

	get '/toys/:id', to: 'toys#show', as: 'toy'
end
