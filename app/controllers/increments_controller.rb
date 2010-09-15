class IncrementsController < ApplicationController

  def index
    order = Order.find(params[:order_id])
    @increments = order.increments
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @increments }
      format.fxml  { render :fxml => @increments }
    end
  end

end