ActionController::Routing::Routes.draw do |map|
  # Routes for debug access to database
  map.resources :adils
  
  # Routes for mobile access
  map.m_today '/today', :controller => 'query', :action => 'today'
  # map.m_post '/post', :controller => 'adils', :action => 'post'
  # map.m_intr '/intr', :controller => 'adils', :action => 'intr'
  # map.m_feed '/feed', :controller => 'adils', :action => 'feed'
  # map.m_tag '/tag', :controller => 'adils', :action => 'tag'
  
  # Web home page
  map.web_home '/', :controller => 'web', :action => 'index'

  # Default routes
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
