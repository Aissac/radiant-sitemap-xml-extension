module NavigationHelpers
  def path_to(page_name)
    case page_name
  
    when /the homepage/i
      root_path
    
    when /sitemap.xml/
      sitemap_path
    
    when /^the (.+?) page$/                                         # translate to named route
      send "#{$1.downcase.gsub(' ','_')}_path"
      
    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

World(NavigationHelpers)