# https://github.com/jonleighton/focused_controller
FriendlyRent::Application.routes.draw do
  match 'home'    => 'home#page', as: :home_page
  match 'gallery' => 'home#gallery', as: :gallery

  resources :searches
  resources :properties

  root to: 'home#page'
end
