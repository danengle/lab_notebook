class WelcomeController < ApplicationController
  def index
    redirect_to :controller => 'pages', :action => 'show', :date => 'today' if logged_in?
  end

end
