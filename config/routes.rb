Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #Add a route for the image optimisation endpoint to map the POST request to the optimise method in image_controller
  post './assets/images/:path', to: 'image#optimise'
end
