class SalesController < ApplicationController
  # GET /sales
  # GET /sales.xml
  # GET /sales.fxml
  def index
    @sales = current_user.sales.current

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales }
      format.fxml  { render :fxml => @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.xml
  # GET /sales/1.fxml
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale }
      format.fxml  { render :fxml => @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.xml
  def new
    @sale = Sale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.xml
  # POST /sales.fxml
  def create
    @sale = Sale.new(params[:sale].merge({:user_id => current_user.id}))

    respond_to do |format|
      if @sale.save
        flash[:notice] = 'Sale was successfully created.'
        format.html { redirect_to(@sale) }
        format.xml  { render :xml => @sale, :status => :created, :location => @sale }
        format.fxml  { render :fxml => @sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @sale.errors }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.xml
  # PUT /sales/1.fxml
  def update
    @sale = Sale.find(params[:id])
    @saved = @sale.update_attributes(params[:sale])

    respond_to do |format|
      if @saved
        flash[:notice] = 'Sale was successfully updated.'
        format.html { redirect_to(@sale) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @sale }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @sale.errors }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.xml
  # DELETE /sales/1.fxml
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to(sales_url) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @sale }
    end
  end
end