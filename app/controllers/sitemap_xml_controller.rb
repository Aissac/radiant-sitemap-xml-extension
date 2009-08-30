class SitemapXmlController < ApplicationController
  no_login_required
  
  def sitemap
    respond_to do |format|
      format.xml {
        @host = Radiant::Config['sitemap_xml_domain'] || "#{request.protocol}#{request.host_with_port}"
        @pages = Page.find(:all, 
          :conditions => {:sitemap => true, :status_id => 100, :virtual => false}, 
          :order => "updated_at DESC")
        render :layout => false
      }
    end
  end
end