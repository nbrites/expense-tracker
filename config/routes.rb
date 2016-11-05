Rails.application.routes.draw do
  get 'expenses/index'
  get 'dashboard/index'
  get 'category/get_categories'

  resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#dashboard'
end
