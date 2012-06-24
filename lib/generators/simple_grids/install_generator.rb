module SimpleGrids
  module Generators
    class InstallGenerator < Rails::Generators::Base
      @root = File.expand_path('../../../../vendor/assets/', __FILE__)
      source_root @root

      desc "Copy the Data Tables assets and locale files to your application."
      
      def copy_all_files
        say_status("installing", "Data Tables assets (images/javascripts/stylesheets)", :green)
        
        # Copying Data Tables images
        # Dir.foreach("#{@root}/images") do |file|  
        #   copy_file file, "app/assets/images/#{file}"
        # end
        # Copying Data Tables javascript and stylesheet files
        copy_file "stylesheets/jquery.dataTables.css", "app/assets/stylesheets/jquery.dataTables.css"
        copy_file "javascripts/jquery.dataTables.min.js", "app/assets/stylesheets/jquery.dataTables.min.js"
      end
  
    end
  end
end