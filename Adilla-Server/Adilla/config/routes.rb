ActionController::Routing::Routes.draw do |map|
  # Web home page
  map.web_home '/', :controller => 'web', :action => 'index'
  
  # Routes for debug access to database
  map.resources :adils_dev
  
  # Routes for mobile access
  map.m_today '/today', :controller => 'adils', :action => 'today'

  # Default routes
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
