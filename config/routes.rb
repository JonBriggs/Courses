Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :course_offerings
  post "course_offerings/markdown_preview"
  root "catalog#index"

  get "catalog/index"
  get "catalog/test"
end
