require 'spec_helper'

describe SitemapXmlController do
  describe "handling GET sitemap" do
    before(:each) do
      @pages = (1..3).map { mock_model(Page) }
    end
    
    def do_get
      get :sitemap
    end
    
    it "assigns the host for the view" do
      do_get
      assigns[:host].should == "http://test.host"
    end
    
    it "finds the pages to be shown in sitemap and assigns them for the view" do
      Page.should_receive(:for_sitemap_xml).and_return(@pages)
      do_get
      assigns[:pages].should == @pages
    end
    
    it "renders the sitemap template" do
      do_get
      response.should render_template(:sitemap)
    end
  end
end