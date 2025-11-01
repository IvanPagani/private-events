Rails.application.routes.draw do
  root "events#index"

  devise_for :users
  resources :users, only: [ :show ]

  resources :events do
    resources :event_invitations, only: [ :new, :create, :update ]
  end

  resources :event_attendances, only: [ :create, :destroy ]
end
