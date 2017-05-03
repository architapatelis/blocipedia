Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  delete 'charges/delete' => 'charges#destroy'
  resources :wikis
  devise_for :users
  get 'about' => 'welcome#about'
  # default page the app loads when we navigate to the home page URL.
  root 'welcome#index'
end
