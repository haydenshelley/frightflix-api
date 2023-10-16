Rails.application.routes.draw do
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"

  # user signup and login actions
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
end
