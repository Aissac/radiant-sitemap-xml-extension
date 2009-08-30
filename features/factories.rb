Factory.define(:page) do |f|
  f.sequence(:title) { |i| "Page #{i}" }
  f.slug { |a| a.title.downcase.gsub(/[^-a-z0-9~\s\.:;+=_]/, '').gsub(/[\s\.:;=+]+/, '-') }
  f.breadcrumb { |a| a.title }
  f.sitemap true
  f.change_frequency "weekly"
  f.priority "0.5"
  f.status_id 100
end

Factory.define(:hidden_page, :parent => :page) do |f|
  f.sitemap false
end