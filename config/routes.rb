Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "republish", to: 'application#republish'
  get "api/full_catalog", to: 'catalog#full_catalog'
  get "api", to: 'catalog#api'
  resources :course_offerings
  post "course_offerings/markdown_preview"
  root "catalog#index"

  get "catalog/index"
  get "catalog/test"
end
