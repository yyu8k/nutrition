Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :events
  resources :records
  root 'records#index'
  resources :foods do
    collection do
      get 'search'
    end
  end
  resources :tweets, only: [:index]
  get 'inquiry' => 'inquiry#index'              # 入力画面
end
