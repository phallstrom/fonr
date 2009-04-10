class HelperController < ApplicationController

  def helper
    @helper_name = params[:id]
    @helper = property(:helpers)[@helper_name.to_sym]
    @helper[:name] = @helper_name
  end

end
