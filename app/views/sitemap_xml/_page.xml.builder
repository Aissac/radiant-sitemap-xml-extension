xml.url do
  xml.loc "#{@host}#{page.url}"
  xml.lastmod page.updated_at.strftime('%Y-%m-%d')
  xml.changefreq page.change_frequency
  xml.priority page.priority
end
