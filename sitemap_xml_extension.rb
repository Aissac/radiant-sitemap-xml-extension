# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SitemapXmlExtension < Radiant::Extension
  version "0.1"
  description "Radiant Extension to automatically generate a sitemap XML for you site"
  url "http://blog.aissac.ro/radiant/sitemap-xml-extension/"
  
  define_routes do |map|
    map.sitemap '/sitemap.xml', :controller => 'sitemap_xml', :action => 'sitemap'
  end
  
  CHANGE_FREQUENCY_OPTIONS = [
    ["always","always"],
    ["hourly","hourly"],
    ["daily","daily"],
    ["weekly","weekly"],
    ["monthly","monthly"],
    ["yearly","yearly"],
    ["never","never"]
  ]
  
  FREQUENCY_OPTIONS = [
    ["0.0","0.0"],
    ["0.1","0.1"],
    ["0.2","0.2"],
    ["0.3","0.3"],
    ["0.4","0.4"],
    ["0.5","0.5"],
    ["0.6","0.6"],
    ["0.7","0.7"],
    ["0.8","0.8"],
    ["0.9","0.9"],
    ["1.0","1.0"]
  ]
  
  def activate    
    admin.page.edit.add :extended_metadata, 'admin/pages/sitemap_xml_form', :after => 'edit_extended_metadata'
  end
  
  def deactivate
  end
  
end
