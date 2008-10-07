map.resources :newsletters,
  :controller  => 'admin/newsletters',
  :path_prefix => 'admin/sites/:site_id'

map.resources :newsletter_messages,
  :path_prefix => 'admin/sites/:site_id/newsletters/:newsletter_id',
  :controller => 'admin/newsletter_messages'
  
map.resources :newsletter_subscriptions,
  :path_prefix => 'admin/sites/:site_id/newsletters/:newsletter_id',
  :controller => 'admin/newsletter_subscriptions'

