Rails.application.routes.draw do
  resources :reactions
  resources :breakpoints do
    collection { post :import }
  end
  resources :drugs do
  	collection { post :import }
  end
  resources :mics do
  	collection { post :import }
  end
  resources :isolates do 
    collection { post :import }
  end
  resources :organisms do
    collection { post :import }
  end
  
devise_for :users
  root 'reactions#index'
end
