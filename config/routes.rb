Rails.application.routes.draw do
  resources :contacts
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :events
  root 'events#index'
  resources :foods do
    collection do
      get 'search'
    end
  end
  resources :index, only: [:index]
end
