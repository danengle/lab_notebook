class ProjectsController < ApplicationController
  
  before_filter :login_required
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    not_allowed(@project, "You are not allowed to edit the project") unless current_user.project_owner?(@project)
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project].merge({ :owner_id => current_user.id }))

    respond_to do |format|
      if current_user.save_object(@project)
        current_user.projects << @project
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    if current_user.project_owner?(@project) && @project.users.size == 1
      @project.destroy
    else
      not_allowed(@project, "You are not allowed to delete this project because you are not the owner or other researchers are currently assigned to it.")
    end

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_me
    @project = Project.find(params[:id])
    current_user.projects << @project unless current_user.projects.include?(@project)
    flash[:notice] = "You have been added to the project"
    redirect_to @project
  end
end
