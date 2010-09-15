class OrdersController < ApplicationController
  
  before_filter :login_required
  
  # GET /orders
  # GET /orders.xml
  # GET /orders.fxml
  def index
    @orders = current_user.orders.current
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
      format.fxml  { render :fxml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  # GET /orders/1.fxml
  def show
    @order = Order.find(params[:id])
    session[:order_id] = @order.id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
      format.fxml  { render :fxml => @order }
    end
  end
  
  def increment
    order = Order.find(params[:id])
    @increments = order.increments
    respond_to do |format|
      format.xml  { render :xml => @increments }
      format.fxml  { render :fxml => @increments }
    end
  end  

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  # POST /orders.fxml
  def create
    last_increment = params[:order].delete(:last_increment)
    i_d = params[:order].delete(:i_d)
    @order = Order.new(params[:order].merge({:user_id => current_user.id}))

    respond_to do |format|
      if @order.save
        flash[:notice] = 'Order was successfully created.'
        format.html { redirect_to(@order) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
        format.fxml  { render :fxml => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @order.errors }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  # PUT /orders/1.fxml
  def update
    @order = Order.find(params[:id])
    last_increment = params[:order].delete(:last_increment)
    i_d = params[:order].delete(:i_d)
    from = @order.items_received
    @saved = @order.update_attributes(params[:order])
    to = @order.items_received
    
    @order.increments.create(:from => from, :to => to, :received_at => last_increment) if from && to && from != to 
    
    respond_to do |format|
      if @saved
        flash[:notice] = 'Order was successfully updated.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @order }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @order.errors }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  # DELETE /orders/1.fxml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @order }
    end
  end
  
  def clear_session
    session[:order_id] = nil
  end
  
end