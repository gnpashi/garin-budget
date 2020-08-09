require 'sidekiq/web'

Rails.application.routes.draw do
  resources :transactions do
		member do
			get 'success'
		end
  end
  resources :budgets
  resources :garins
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


		Rails.application.routes.draw do
			devise_for :users, controllers: {
				registrations: 'users/registrations'
			}
		end
  # devise_for :users


  # root to: 'garins#index'
	root to: "garins#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
