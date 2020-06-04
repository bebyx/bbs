Rails.application.routes.draw do
  
  resources :topics

  root 'welcome#index'
end
