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
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from SitemapXmlExtension"
        Dir[SitemapXmlExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(SitemapXmlExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
