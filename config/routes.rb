Mariage::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :guests
  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end  

  root :to => redirect('/')
end
