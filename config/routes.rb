Rails.application.routes.draw do
  
  # get "/birds", to: "birds#index"
  # get "/birds/:id", to: "birds#show"
  # resources :birds ,only: [:index, :show, :create, :update, :destroy]
  # since we are using all the routes the only can be emmitted
  resources :birds
  patch "/birds/:id/like", to: "birds#increment_likes"
end
