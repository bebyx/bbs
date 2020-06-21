Rails.application.routes.draw do

  resources :boards, param: :name do
    resources :topics, except: [:index, :new] do
      resources :replies, except: [:index, :new, :show]
    end
  end

  get 'rules', to: 'static_pages#rules', as: :rules
  get 'about', to: 'static_pages#about', as: :about
  get 'howto', to: 'static_pages#howto', as: :howto

  root 'boards#index'
end
