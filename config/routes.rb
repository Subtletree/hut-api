Rails.application.routes.draw do

  post 'token-auth', to: 'user_sessions#create'
  delete 'token-auth', to: 'user_sessions#destroy'

  resources :users do
    member do
      get :activate
    end
  end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
