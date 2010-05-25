class SitemapXmlExtension < Radiant::Extension
  version "0.9"
  description "Radiant Extension to automatically generate a sitemap XML for you site"
  url "http://blog.aissac.ro/radiant/sitemap-xml-extension/"
  
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
    Page.send(:include, SitemapXml::PageExtensions)
    admin.page.edit.add :extended_metadata, 'admin/pages/sitemap_xml_form'
  end
  
  def deactivate
  end  
end
