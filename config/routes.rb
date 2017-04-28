Rails.application.routes.draw do
  get 'about' => 'welcome#about'
  # default page the app loads when we navigate to the home page URL.
  root 'welcome#index'
end
