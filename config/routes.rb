Rails.application.routes.draw do
  devise_for :users
  resources :exercises do
    resources :comments
    post 'change_rating'
  end
  get 'users/:id', to: 'users#show', as: 'user'
  get 'feed', to: 'exercises#feed'
  root 'exercises#feed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
