# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SitemapXmlExtension < Radiant::Extension
  version "0.1"
  description "Creates an xml sitemap for your site"
  url "http://blog.aissac.ro/radiant/sitemap-xml-extension/"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :sitemap_xml
  #   end
  # end
  
  def activate
    # admin.tabs.add "Sitemap Xml", "/admin/sitemap_xml", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Sitemap Xml"
  end
  
end
