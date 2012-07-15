module SimpleGrid
  module Helpers
    def simple_grid(collection, options = {})
      if collection.size > 0
        current_model = collection.first.class
        columns = remove_columns(Rails.const_get(current_model.to_s).column_names.to_a, options[:exclude_columns])
        render :partial => '/simple_grid/grid', :locals => { :current_model => current_model.to_s.downcase,
                                                              :columns => columns,
                                                              :collection => collection,
                                                              :extra_columns => verify_params(options, :extra_columns),
                                                              :actions => verify_params(options, :actions) }
      else
        render :text => "No records to show."
      end
    end

    def remove_columns(columns, exclude)
      display = []
      exclude.nil? ? display = columns : columns.each { |c| display << c unless exclude.include?(c) }
      display
    end
    
    def verify_params(options, key)
      options.has_key?(key) ? options[key] : {}
    end
    
  end
end