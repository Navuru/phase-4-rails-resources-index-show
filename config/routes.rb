Rails.application.routes.draw do
  
  # get "/birds", to: "birds#index"
  # get "/birds/:id", to: "birds#show"
  resources :birds ,only: [:index, :show, :create, :update]
  patch "/birds/:id/like", to: "birds#increment_likes"
end
