Rails.application.routes.draw do

  root :to => 'home#index'
  post 'upload', :to => 'home#upload'
  get 'tweets/show/:tweet_id', :to => 'tweets#show'
  get 'tweets/get', :to => 'tweets#get'

end
