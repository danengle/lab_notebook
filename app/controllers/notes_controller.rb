class NotesController < ApplicationController

  before_filter :login_required
  before_filter :get_and_verify_project_and_experiment

  # GET /notes/1/edit
  def edit
    @note = @experiment.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  def create
    @note = @experiment.notes.new(params[:note])
    respond_to do |format|
      if current_user.save_object(@note)
        
        flash[:notice] = 'Note was successfully created.'
        format.html { redirect_to([@project, @experiment]) }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @note = @experiment.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        flash[:notice] = 'Note was successfully updated.'
        format.html { redirect_to(@note) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @note = @experiment.notes.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(notes_url) }
      format.xml  { head :ok }
    end
  end

end
