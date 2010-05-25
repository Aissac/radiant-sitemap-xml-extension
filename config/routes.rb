ActionController::Routing::Routes.draw do |map|
  map.sitemap '/sitemap.xml', :controller => 'sitemap_xml', :action => 'sitemap'
end