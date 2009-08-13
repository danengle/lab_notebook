class PagesController < ApplicationController
  def index
  end

  def show
    @page = current_user.pages.find_by_page_date(params[:date])
  end

end
