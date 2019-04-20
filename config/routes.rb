Rails.application.routes.draw do
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new]
  end
  resources :authors, only: [:show, :destroy]
  resources :book_authors, only: [:new]
  resources :reviews, only: [:index, :create, :destroy]
  # delete '/reviews/:id', to: "reviews#delete", as: :delete_review
  # delete '/books/:id', to: "books#delete", as: :delete_book
  # delete '/authors/:id', to: "authors#delete", as: :delete_author
end
