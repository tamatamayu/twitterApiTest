Rails.application.routes.draw do
  resources :hash_tags
  resources :tweet_admin_users
    post 'admin/search' => 'tweet_admin_users#search'
  resources :tweets
    get 'tweet_text/analysis' => 'tweets#analysis'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
