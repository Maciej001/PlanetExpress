Rails.application.routes.draw do
	resources :crew

  get 'static', to: 'application#static'
  root to: 'application#index'
end
