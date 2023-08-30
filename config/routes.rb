Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'reset_password',
    registration: 'signup'
  }

  devise_scope :user do
    root to: 'devise/sessions#new', as: :login
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
