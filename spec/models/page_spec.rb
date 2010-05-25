require 'spec_helper'

describe Page do
  describe "for_sitemap_xml named_scope" do
    before(:each) do
      @visible_page = Factory.create(:page_visible_in_sitemap)
    end
    
    it "fetches the visible page (sitemap attribute set to true)" do
      Page.for_sitemap_xml.should == [@visible_page]
    end
    
    it "does not fetch pages with false sitemap attribute" do
      page_not_visible = Factory.create(:page_not_visible_in_sitemap)
      Page.for_sitemap_xml.should == [@visible_page]
    end
    
    it "does not fetch draft pages" do
      page_not_visible = Factory.create(:draft_page)
      Page.for_sitemap_xml.should == [@visible_page]
    end
    
    it "does not fetch scheduled pages" do
      page_not_visible = Factory.create(:scheduled_page)
      Page.for_sitemap_xml.should == [@visible_page]
    end

    it "does not fetch hidden pages" do
      page_not_visible = Factory.create(:hidden_page)
      Page.for_sitemap_xml.should == [@visible_page]
    end

    it "does not fetch reviewed pages" do
      page_not_visible = Factory.create(:reviewed_page)
      Page.for_sitemap_xml.should == [@visible_page]
    end

    it "does not fetch virtual pages" do
      page_not_visible = Factory.create(:virtual_page)
      Page.for_sitemap_xml.should == [@visible_page]
    end
  end
end