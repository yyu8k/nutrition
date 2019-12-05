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
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
end
