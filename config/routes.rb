Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :v1, defaults: { format: :json } do
    devise_for :users
    resources :users do
      resources :jogging_times
    end
    # resources :users
        post '/auth/login', to: 'authentication#login'
        delete '/auth/logout', to: 'authentication#logout'
        get '/*a', to: 'application#not_found'
        
  end

end
