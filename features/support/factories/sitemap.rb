Factory.define(:page_visible_in_sitemap, :parent => :page) do |f|
  f.sitemap true
  f.change_frequency "weekly"
  f.priority "0.5"
end

Factory.define(:page_not_visible_in_sitemap, :parent => :page) do |f|
  f.sitemap false
end