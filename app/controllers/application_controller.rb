class ApplicationController < ActionController::Base

  before_action :global_variables

  def global_variables
    @signed_in = true
  end
end
