Rails.application.routes.draw do
  get 'trainer/feed'
  root 'trainer#feed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
