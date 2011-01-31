class ReturnsController < ApplicationController
  # GET /sales
  # GET /sales.xml
  # GET /sales.fxml
  def index
    @returns = Return.for_user(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @returns }
      format.fxml  { render :fxml => @returns }
    end
  end

  # GET /sales/1
  # GET /sales/1.xml
  # GET /sales/1.fxml
  def show
    @return = Return.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @return }
      format.fxml  { render :fxml => @return }
    end
  end

  # GET /sales/new
  # GET /sales/new.xml
  def new
    @return = Return.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @return }
    end
  end

  # GET /sales/1/edit
  def edit
    @return = Return.find(params[:id])
  end

  # POST /sales
  # POST /sales.xml
  # POST /sales.fxml
  def create
    @return = Return.new(params[:return].merge({:user_id => current_user.id}))

    ## Adjust Warehouse (-)
    Warehouse.rem(current_user.id, @return.maker_id, @return.model_id, @return.items_returned)
    
    ## Adjust Budget (+)
    Budget.add(current_user, @return.total)

    respond_to do |format|
      if @return.save
        flash[:notice] = 'Return was successfully created.'
        format.html { redirect_to(@return) }
        format.xml  { render :xml => @return, :status => :created, :location => @return }
        format.fxml  { render :fxml => @return }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @return.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @return.errors }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.xml
  # PUT /sales/1.fxml
  def update
    @return = Return.find(params[:id])
    #@saved = @return.update_attributes(params[:return])

    respond_to do |format|
      if @return
        flash[:notice] = 'Return was successfully updated.'
        format.html { redirect_to(@return) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @return }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @return.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @return.errors }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.xml
  # DELETE /sales/1.fxml
  def destroy
    @return = Return.find(params[:id])
    
    ## Adjust Warehouse (+)
    Warehouse.add(current_user.id, @return.maker_id, @return.model_id, @return.items_returned)
    
    ## Adjust Budget (-)
    Budget.rem(current_user, @return.total)
    
    
    @return.destroy

    respond_to do |format|
      format.html { redirect_to(returns_url) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @return }
    end
  end
end