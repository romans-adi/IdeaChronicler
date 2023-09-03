Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
  }

  devise_scope :user do
    root to: 'devise/sessions#new', as: :login
    get 'sign_in', to: 'devise/sessions#new'
    get 'secret', to: 'devise/passwords#new'
    get 'unlock', to: 'devise/unlocks#new'
    get 'verification', to: 'devise/confirmations#new'
    get 'signup', to: 'devise/registrations#new'
  end

  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
          resources :likes
        end
      end
    end
  end
end
