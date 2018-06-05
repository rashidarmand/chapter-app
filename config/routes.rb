Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get '/read/:id/chapter/:chapter_id' => 'read#chapter', as: 'read_chapter'

  put '/users/:id' => 'clearance/users#update', as: 'update_user'
  root 'home#index'
  resources :user_books
  resources :profile
  resources :read
  resources :books
  resources :account
  resources :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
