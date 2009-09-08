# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  include AuthenticatedSystem
  include ExeptionNotifiable
  
  def get_and_verify_project_and_experiment
    @project = Project.find(params[:project_id])
    @experiment = @project.experiments.find(params[:experiment_id] || params[:id])
    not_allowed(@project, "You are not allowed to access that experiment.") unless current_user.experiments.include?(@experiment)
  end
  
  def not_allowed(redirect_url, msg = "You are not allowed to do that.")
    flash[:error] = msg
    respond_to do |format|
      format.html do
        redirect_to redirect_url
      end
      # format.any doesn't work in rails version < http://dev.rubyonrails.org/changeset/8987
      # Add any other API formats here.  (Some browsers, notably IE6, send Accept: */* and trigger 
      # the 'format.any' block incorrectly. See http://bit.ly/ie6_borken or http://bit.ly/ie6_borken2
      # for a workaround.)
      format.any(:json, :xml) do
        request_http_basic_authentication 'Web Password'
      end
    end
    
  end
end
