module SitemapXml
  module PageExtensions
    
    def self.included(base)
      base.class_eval do
        named_scope :for_sitemap_xml, :conditions => { :sitemap => true, :status_id => 100, :virtual => false }, :order => "updated_at DESC"
      end
    end  
  end
end