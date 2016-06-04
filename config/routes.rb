Rails.application.routes.draw do
  get 'users/favourites', to: "users#favourites"
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'welcome#index'
  resources :posts do
    resources :comments
    member do
      put "like", to: "posts#upvote"
    end
  end
end
