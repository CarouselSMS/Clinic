ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  map.resources :conversations do |c|
    c.resources :messages
  end
  
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "conversations" 
  map.connect '/sl_callbacks', :controller => 'sl_callbacks'

end
