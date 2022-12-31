Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :v1, defaults: { format: :json } do
    resources :users do
      resources :hotels, only: [:index, :create, :destroy]
      resources :reservations, only: [:index, :create, :destroy]
    end
    # resources :users
        post '/auth/login', to: 'authentication#login'
        delete '/auth/logout', to: 'authentication#logout'
        get '/*a', to: 'application#not_found'
        
  end

end
