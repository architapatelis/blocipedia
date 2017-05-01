Rails.application.routes.draw do
  resources :wikis, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  devise_for :users
  get 'about' => 'welcome#about'
  # default page the app loads when we navigate to the home page URL.
  root 'welcome#index'
end
