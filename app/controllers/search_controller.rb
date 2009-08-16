class SearchController < ApplicationController
  
  def index
    @search = params[:q].gsub(/^(Project\:|Experiment\:|Note\:)/,'')
    @projects = Project.search(@search)
    @experiments = Experiment.search(@search)
    @notes = Note.search(@search, :with => { :user_id => current_user.id })
    respond_to do |format|
      format.html
      format.js { render :partial => 'results', :layout => false }
    end
  end

end
