class ExperimentsController < ApplicationController
  
  before_filter :login_required
  before_filter :get_project
  # GET /experiments
  # GET /experiments.xml
  def index
    @experiments = Experiment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @experiments }
    end
  end

  # GET /experiments/1
  # GET /experiments/1.xml
  def show
    @experiment = @project.experiments.find(params[:id])
    @note = @experiment.notes.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @experiment }
    end
  end

  # GET /experiments/new
  # GET /experiments/new.xml
  def new
    @experiment = Experiment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @experiment }
    end
  end

  # GET /experiments/1/edit
  def edit
    @experiment = Experiment.find(params[:id])
  end

  # POST /experiments
  # POST /experiments.xml
  def create
    @experiment = @project.experiments.new(params[:experiment].merge({ :user_id => current_user.id }))
    respond_to do |format|
      if current_user.save_object(@experiment)
        flash[:notice] = 'Experiment was successfully created.'
        format.html { redirect_to([@project,@experiment]) }
        format.xml  { render :xml => @experiment, :status => :created, :location => @experiment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @experiment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /experiments/1
  # PUT /experiments/1.xml
  def update
    @experiment = @project.experiments.find(params[:id])

    respond_to do |format|
      if @experiment.update_attributes(params[:experiment])
        flash[:notice] = 'Experiment was successfully updated.'
        format.html { redirect_to([@project,@experiment]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @experiment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /experiments/1
  # DELETE /experiments/1.xml
  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy

    respond_to do |format|
      format.html { redirect_to(experiments_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def get_project
    @project = current_user.projects.find(params[:project_id])
  end
end
