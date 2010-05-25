require 'factory_girl'
Dir[File.expand_path(File.join(File.dirname(__FILE__), '/factories', '*.rb'))].each {|f| require f}