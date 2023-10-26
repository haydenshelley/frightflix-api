Rails.application.routes.draw do
  get "/movies" => "movies#index"
  get "/movies/liked" => "movies#liked"
  post "/movies/liked" => "movies#add_liked"
  delete "/movies/liked" => "movies#delete_liked"
  get "/random_three" => "movies#random_three"
  get "/movies/category/:category_name" => "movies#show_by_category", as: :movies_by_category
  get "/movies/:id" => "movies#show"
  get "movies/random/:category_name" => "movies#random"

  # user signup and login actions
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
end
