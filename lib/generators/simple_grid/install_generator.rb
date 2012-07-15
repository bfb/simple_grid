module SimpleGrid
  module Generators
    class InstallGenerator < Rails::Generators::Base
      @@root = File.expand_path('../../../../vendor/assets/', __FILE__)
      source_root @@root

      desc "Copy the Data Tables assets files to the application."
      
      def copy_all_files
        
        say_status("installing", "Data Tables assets (images/javascripts/stylesheets)", :green)
        # Verify the Rails version to copy the files to the right folder
        Rails::VERSION::MINOR > 0 ? path = "app/assets" : path = "public"
        # Copying Data Tables images
        Dir.foreach("#{@@root}/images") do |file|  
          copy_file "#{@@root}/images/" + file, "#{path}/images/#{file}" if file =~ /png$/
        end
        # Copying Data Tables javascript and stylesheet files
        copy_file "stylesheets/jquery.dataTables.css", "#{path}/stylesheets/jquery.dataTables.css"
        copy_file "javascripts/jquery.dataTables.min.js", "#{path}/javascripts/jquery.dataTables.min.js"
        # Show message to include the helper
        say("Include the SimpleGrid helper in your ApplicationHelper:", :green)
        say("module ApplicationHelper\n  include SimpleGrid::Helpers\nend", :green)
      end
  
    end
  end
end