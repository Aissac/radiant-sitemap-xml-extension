xml.instruct!
xml.urlset(:xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9") do
  xml << (render :partial => 'page', :collection => @pages)
end
