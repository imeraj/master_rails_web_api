Rails.application.routes.draw do
  scope :api do
    resources :books
    resources :authors
    resources :publishers
    resources :users, except: :put

    resources :user_confirmations, only: :show, param: :confirmation_token
    resources :password_resets, only: [:show, :create, :update],
              param: :reset_token

    resources :purchases, only: [:index, :show, :create]

    resources :access_tokens, only: :create do
      delete '/', action: :destroy, on: :collection
    end

    get '/search/:text', to: 'search#index'
  end

  root to: 'books#index'
end
