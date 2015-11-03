Rails.application.routes.draw do


#Address Routes/////////////////////

  get 'addresses/index'

  get 'addresses/show'

  get 'addresses/new' => 'addresses#new'

  post 'addresses/create' => 'addresses#create'

  get 'addresses/edit'

  get 'addresses/update'

  get 'addresses/destroy'

#Static_Pages Routes/////////////////
  root 'static_pages#home'

  get 'static_pages/about'

  get 'static_pages/how_to'

  get 'static_pages/faq'

#User Routes/////////////////

  get 'users' => 'users#index'

  get 'users/show'

  get 'users/new' => 'users#new'

  post 'users/create'=> 'users#create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  #Photo routes/////////////////

  get 'photos/index'

  get 'photos/show'

  get 'photos/new'

  get 'photos/create'

  get 'photos/edit'

  get 'photos/update'

  get 'photos/destroy'

#Forum routes////////////////////

  get 'forums/index'

  get 'forums/show'

  get 'forums/new'

  get 'forums/create'

  get 'forums/edit'

  get 'forums/update'

  get 'forums/destroy'

  #Address_Name Routes//////////////////

    get 'address_names/index'

    get 'address_names/show'

    get 'address_names/new'

    get 'address_names/create'

    get 'address_names/edit'

    get 'address_names/update'

    get 'address_names/destroy'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
