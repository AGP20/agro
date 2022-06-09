Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/:id', to: 'pages#profile', as: :user_profile

  get '/accepted/:id', to: 'loan_proposals#accept', as: :accept_loan

  resources :users do
    resources :addresses do
    end
  end

  resources :scores do
  end

  resources :loan_proposals do
  end
end
