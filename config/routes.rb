Rails.application.routes.draw do
  devise_for :incharges
  resources :items
	root 'home#index'
	get 'home/about' => 'home#about'
	get 'items/:id/complain' => 'items#complain'
	patch 'items/:id/complain/:id' => 'items#cupdate'
	patch 'items/complain/resolved/:id' => 'items#resolved'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
