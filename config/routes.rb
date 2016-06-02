Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'welcome#index'
  resources :posts do
    resources :comments
    member do
      put "like", to: "posts#upvote"
    end
  end
end
