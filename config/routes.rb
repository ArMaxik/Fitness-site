Rails.application.routes.draw do
  resources :exercises do
    resources :comments
  end
  get 'feed', to: 'exercises#feed'
  root 'exercises#feed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
