Rails.application.routes.draw do

  resources :boards, param: :name do
    resources :topics, except: [:index, :new] do
      resources :replies, except: [:index, :new, :show]
    end
  end

  root 'welcome#index'
end
