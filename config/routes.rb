ActionController::Routing::Routes.draw do |map|
  map.resources :models
  map.resources :budgets
  map.resources :makers
  map.resources :sales
  map.resources :returns
  map.resources :orders, :has_many => :increments
  map.resources :users
  map.resources :stocks
  map.resources :increments
  map.resources :warehouses
  map.resources :reports, 
                  :collection => {
                    :ordini => :get
                  },
                  :member => {
                    :ordini => :get
                  }
  
  map.resources :session
  map.resources :stats
  
  map.homepage '/', :controller => 'homepage'
  map.login   '/login/:key', :controller => 'session', :action => 'login'
  map.logout  '/logout', :controller => 'session', :action => 'logout'
  
  map.root :controller => 'homepage'

  map.app 'app/', :controller => 'app'
  map.admin 'admin/', :controller => 'app', :action => 'admin'

  map.current_user '/current_user', :controller => 'session', :action => 'index'
end