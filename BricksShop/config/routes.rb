Rails.application.routes.draw do
  	devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'pages#home'

	# Item actions #
	get '/defaultList', to: 'items#defaultList'	
	get '/searchItem', to: 'items#searchItem'
	get '/searchPack', to: 'items#searchPack'
	get '/searchToy', to: 'items#searchToy'
	get '/searchPiece', to: 'items#searchPiece'
	
	get '/listPacks', to: 'items#listPacks'
	get '/listToys', to: 'items#listToys'
	get '/listPieces', to: 'items#listPieces'

	# User actions #
	get '/showUser', to: 'users#showUser'

	# Cart actions #
	get '/showCart', to: 'cart#showCart'
	post '/addItem/:id', to: 'cart#addItem'
	delete '/removeItem/:position', to: 'cart#removeItem'
	delete '/emptyCart', to: 'cart#emptyCart'

	# Order actions #
	get '/orderPayment', to: 'orders#orderPayment'
	get '/showOrder/:id', to: 'orders#showOrder'
	get '/listOrders', to: 'orders#listOrders'
	get '/emptyOrder', to: 'orders#emptyOrder'
	get '/cancelOrder/:id', to: 'orders#cancelOrder'
	get '/listCancelledOrders', to: 'orders#listCancelledOrders'

	# PayPal actions #
	post '/createpayment', to: 'orders#createpayment'
	post '/executepayment', to: 'orders#executepayment'
end
