Spree::Core::Engine.routes.draw do
  resources :reviews, only: [:create] do
    post :rating, on: :collection
  end

  namespace :admin do
    resources :reviews, only: [:index, :edit, :update]
  end
end
