namespace :radiant do
  namespace :extensions do
    namespace :sitemap_xml do
      
      desc "Runs the migration of the Sitemap Xml extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          SitemapXmlExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          SitemapXmlExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Sitemap Xml to the instance public/ directory."
      task :update => :environment do
        puts "This extension has no public assets.  Nothing done."
      end  
    end
  end
end
