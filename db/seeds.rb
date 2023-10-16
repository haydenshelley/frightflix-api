not_so_scary_movies = CSV.read('not_so_scary.csv')
p not_so_scary_movies[0][0]
p not_so_scary_movies[0][1]
p not_so_scary_movies[0][2]


not_so_scary_movies.each do |movie|
  Movie.create!(
    title: movie[0],
    year: movie[1],
    description: movie[2],
    category_id: 1
  )
end
