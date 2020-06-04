Rails.application.routes.draw do

  resources :topics do
    resources :replies
  end

  root 'welcome#index'
end
