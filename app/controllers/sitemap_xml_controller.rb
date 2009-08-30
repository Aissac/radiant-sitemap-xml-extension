require 'builder'

class SitemapXmlController < ApplicationController
  no_login_required
  
  def sitemap
    respond_to do |format|
      format.xml {
        @xml = Builder::XmlMarkup.new
        @pages = Page.find(:all, :conditions => {:sitemap => true}, :order => "updated_at DESC")
        render :layout => false
      }
    end
  end
end