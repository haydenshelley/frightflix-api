Rails.application.routes.draw do
  get "/movies" => "movies#index"
  get "/movies/category/:category_name" => "movies#show_by_category", as: :movies_by_category
  get "/movies/:id" => "movies#show"

  # user signup and login actions
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
end
