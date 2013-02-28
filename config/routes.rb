ImageRanker::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  match '/users/:user_id/confirm/:confirmation_code' => 'users#check_confirm_code'

  resources :users
  resources :sessions
  resources :images do
    member { post :vote }
  end

  root to: 'images#index'
end
