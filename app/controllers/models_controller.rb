class ModelsController < ApplicationController
  # GET /models
  # GET /models.xml
  # GET /models.fxml
  def index
    @models = Model.find(:all, :order => "name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @models }
      format.fxml  { render :fxml => @models }
    end
  end

  # GET /models/1
  # GET /models/1.xml
  # GET /models/1.fxml
  def show
    @model = Model.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @model }
      format.fxml  { render :fxml => @model }
    end
  end

  # GET /models/new
  # GET /models/new.xml
  def new
    @model = Model.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @model }
    end
  end

  # GET /models/1/edit
  def edit
    @model = Model.find(params[:id])
  end

  # POST /models
  # POST /models.xml
  # POST /models.fxml
  def create
    @model = Model.new(params[:model])

    respond_to do |format|
      if @model.save
        flash[:notice] = 'Model was successfully created.'
        format.html { redirect_to(@model) }
        format.xml  { render :xml => @model, :status => :created, :location => @model }
        format.fxml  { render :fxml => @model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @model.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @model.errors }
      end
    end
  end

  # PUT /models/1
  # PUT /models/1.xml
  # PUT /models/1.fxml
  def update
    @model = Model.find(params[:id])
    @saved = @model.update_attributes(params[:model])

    respond_to do |format|
      if @saved
        flash[:notice] = 'Model was successfully updated.'
        format.html { redirect_to(@model) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @model }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @model.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @model.errors }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.xml
  # DELETE /models/1.fxml
  def destroy
    @model = Model.find(params[:id])
    @model.destroy

    respond_to do |format|
      format.html { redirect_to(models_url) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @model }
    end
  end
end