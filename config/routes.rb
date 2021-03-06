Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users,
                path: "",
                path_name: {
                  sign_in: 'login',
                  sign_out: 'logout',
                  edit: 'profile'
                },
                controllers: {
                  omniauth_callbacks: 'omniauth_callbacks',
                  registrations: 'registrations'
                }

  resources :users, only: [:show]

  resources :rooms do
    resources :reservations, only: :create
  end
  
end
