class PagesController < ApplicationController
  
  before_filter :login_required
  
  def index
    @pages = current_user.pages.all
  end

  def show
    if params[:date] == 'today'
      @page = current_user.todays_page
    else
      @page = current_user.pages.find_by_page_date(params[:date])
    end
  end

  def notebook
    @pages = current_user.pages.find(:all, :order => ["page_date ASC"])
    respond_to do |format|
      format.pdf
    end
  end
end
