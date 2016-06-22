Rails.application.routes.draw do
  get 'users/favourites'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'posts#index'
  resources :posts do
    resources :comments
    member do
      get "like", to: "posts#upvote"
    end
  end
  get 'tobe_posted', to: 'posts#tobe_posted'
  resources :replies
end
