Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'categorys#index'

  get "/" => 'categorys#index'
  get "/random" => 'categorys#random'
  post "/search" => 'choices#search'
  get "/result" => 'choices#result'
end
