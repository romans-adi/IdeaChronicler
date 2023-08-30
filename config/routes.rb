Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock'
  }
  devise_scope :user do
    root to: 'devise/sessions#new', as: :login
    get 'sign_in', to: 'devise/sessions#new'
    get 'password', to: 'devise/passwords#new'
    get 'unlock', to: 'devise/unlocks#new'
    get 'verification', to: 'devise/confirmations#new'
    get 'signup', to: 'devise/registrations#new'
  end
end
