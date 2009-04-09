class HelperController < ApplicationController

  def helper
    @helper = params[:id]
  end

end
