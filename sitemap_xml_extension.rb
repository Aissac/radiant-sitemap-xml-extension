# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SitemapXmlExtension < Radiant::Extension
  version "0.1"
  description "Creates an xml sitemap for your site"
  url "http://blog.aissac.ro/radiant/sitemap-xml-extension/"
  
  define_routes do |map|
    map.sitemap '/sitemap.xml', :controller => 'sitemap_xml', :action => 'sitemap'
  end
  
  CHANGE_FREQUENCY_OPTIONS = [
    ["- Select -",nil],
    ["always","always"],
    ["hourly","hourly"],
    ["daily","daily"],
    ["weekly","weekly"],
    ["monthly","monthly"],
    ["yearly","yearly"],
    ["never","never"]
  ]
  
  FREQUENCY_OPTIONS = [
    ["- Select -",nil],
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
    if Radiant::Config.table_exists?
      Radiant::Config['sitemap_xml_domain'] = 'please set the sitemap_xml_domain in radiant config' unless Radiant::Config['sitemap_xml_domain']
    end
    
    admin.page.edit.add :extended_metadata, 'admin/pages/sitemap_xml_form', :after => 'edit_extended_metadata'
  end
  
  def deactivate
  end
  
end
