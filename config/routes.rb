Rails.application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'public#index'

  namespace :api do
    resource :user, only: [] do
      post '/sign_up', to: 'user/registrations#create', on: :collection
      post '/sign_in', to: 'user/sessions#create', on: :collection
      post '/account', to: 'user/account#update', on: :collection
      post '/password', to: 'user/account#update_password', on: :collection
      get '/reset_password', to: 'user/passwords#new'
      post '/reset_password', to: 'user/passwords#create'
      post '/update_password', to: 'user/passwords#update'
    end

    resource :user_company_type, only: [] do
      get '/user_company_types', to: 'user_company_type/user_company_type#index'
    end

    resource :user_type, only: [] do
      get '/user_types', to: 'user_type/user_type#index'
    end
  end

  # namespace :admin do
  #   root 'admins#index'
  #   resources :cities
  #   resources :companies
  #   resources :countries
  #   resources :event_categories
  #   resources :event_types
  #   resources :events
  #   resources :invitations
  #   resources :invitation_types
  #   resources :states
  #   resources :user_company_types
  #   resources :user_types
  # end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
