Rails.application.routes.draw do

  resources :boards do
    resources :topics do
      resources :replies
    end
  end

  root 'welcome#index'
end
