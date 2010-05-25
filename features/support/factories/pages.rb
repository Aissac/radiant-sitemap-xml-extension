Factory.define(:generic_page, :class => Page) do |f|
  f.sequence(:title) { |i| "Page #{i}"}
  f.breadcrumb { |p| p.title }
  f.slug { |p| "#{p.title.symbolize.to_s.gsub("_", "-")}"}
  f.status_id Status[:published].id
end

Factory.define(:home_page, :parent => :generic_page) do |f|
  f.parent_id nil
  f.slug "/"
end

Factory.define(:page, :parent => :generic_page) do |f|
  f.association :parent, :factory => :generic_page
end

[:draft, :reviewed, :scheduled, :published, :hidden].each do |status|
  Factory.define(:"#{status}_page", :parent => :generic_page) do |f|
    f.status_id Status[status].id
  end
end

Factory.define(:page_with_layout, :parent => :generic_page) do |f|
  f.association :layout
end

Factory.define(:virtual_page, :parent => :generic_page) do |f|
  f.virtual true
end