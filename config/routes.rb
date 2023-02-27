Rails.application.routes.draw do


  devise_for :users
  resources :organizations do
    resources :projects do
      resources :tasks
      post 'create_tasks', on: :member
      post 'create_tasks_background', on: :member
    end
    post 'create_projects', on: :member
    post 'create_projects_background', on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
end
