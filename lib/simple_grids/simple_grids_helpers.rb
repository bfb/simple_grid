module SimpleGrids
  module Helpers
    
    def simple_grid(collection, except = [], extra_columns = {}, actions = {})
      current_model = Kernel.const_get(model_name(collection))
      columns = remove_columns(current_model.column_names.to_a, except)
      render :partial => '/simple_grids/grid', :locals => { :current_model => current_model.to_s.downcase, :collection => collection, :columns => columns, :extra_columns => extra_columns, :actions => actions }
    end

    def model_name(collection)
      collection.to_s.split(":")[0].gsub("[#<", "").split(" ")[0]
    end

    def remove_columns(columns, except)
      columns = columns.each { |c| columns.delete(c) if except.include?(c) }
    end
  end
end