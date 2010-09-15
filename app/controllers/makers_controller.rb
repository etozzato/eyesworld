class MakersController < ApplicationController
  # GET /makers
  # GET /makers.xml
  # GET /makers.fxml
  def index
    @makers = Maker.find(:all, :order => "name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @makers }
      format.fxml  { render :fxml => @makers }
    end
  end

  # GET /makers/1
  # GET /makers/1.xml
  # GET /makers/1.fxml
  def show
    @maker = Maker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @maker }
      format.fxml  { render :fxml => @maker }
    end
  end

  # GET /makers/new
  # GET /makers/new.xml
  def new
    @maker = Maker.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @maker }
    end
  end

  # GET /makers/1/edit
  def edit
    @maker = Maker.find(params[:id])
  end

  # POST /makers
  # POST /makers.xml
  # POST /makers.fxml
  def create
    @maker = Maker.new(params[:maker])

    respond_to do |format|
      if @maker.save
        flash[:notice] = 'Maker was successfully created.'
        format.html { redirect_to(@maker) }
        format.xml  { render :xml => @maker, :status => :created, :location => @maker }
        format.fxml  { render :fxml => @maker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @maker.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @maker.errors }
      end
    end
  end

  # PUT /makers/1
  # PUT /makers/1.xml
  # PUT /makers/1.fxml
  def update
    @maker = Maker.find(params[:id])
    @saved = @maker.update_attributes(params[:maker])

    respond_to do |format|
      if @saved
        flash[:notice] = 'Maker was successfully updated.'
        format.html { redirect_to(@maker) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @maker }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @maker.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @maker.errors }
      end
    end
  end

  # DELETE /makers/1
  # DELETE /makers/1.xml
  # DELETE /makers/1.fxml
  def destroy
    @maker = Maker.find(params[:id])
    @maker.destroy

    respond_to do |format|
      format.html { redirect_to(makers_url) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @maker }
    end
  end
end