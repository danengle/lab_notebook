class AttachmentsController < ApplicationController
  
  before_filter :get_and_verify_project_and_experiment

  # POST /attachments
  # POST /attachments.xml
  def create
    @attachment = @experiment.attachments.new(params[:attachment])

    respond_to do |format|
      if current_user.save_object(@attachment)
      # if @attachment.save
        flash[:notice] = 'Attachment was successfully created.'
        format.html { redirect_to([@project, @experiment]) }
        format.xml  { render :xml => @attachment, :status => :created, :location => @attachment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.xml
  def update
    @attachment = @experiment.attachments.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        flash[:notice] = 'Attachment was successfully updated.'
        format.html { redirect_to([@project,@experiment]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.xml
  def destroy
    @attachment = @experiment.attachments.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to([@project,@experiment]) }
      format.xml  { head :ok }
    end
  end

end
