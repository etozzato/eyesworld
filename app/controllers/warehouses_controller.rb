class WarehousesController < ApplicationController
  
  before_filter :login_required
  
  def index
    @warehouses = Warehouse.find_by_sql(["SELECT orders.model_id, sum(orders.items_received) as items_available, min(orders.id) as id, min(orders.maker_id) as maker_id FROM orders WHERE orders.user_id = ? AND (order_date BETWEEN ? AND ?) GROUP BY orders.model_id", current_user.id, "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"])
    
    sales = Sale.find_by_sql(["SELECT sales.model_id, sum(sales.items_sold) as sold FROM sales WHERE sales.user_id = ? AND (sale_date BETWEEN ? AND ?) GROUP BY sales.model_id", current_user.id, "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"])
    
    sales_hash = {}
    sales.each {|e| sales_hash[e.model_id] = e.sold.to_i }
    
    @warehouses.collect {|e| (e.items_available = e.items_available.to_i - sales_hash[e.model_id] if sales_hash[e.model_id]); }
    @warehouses = @warehouses.sort_by { |el| el.model.name }

    @warehouses.delete_if {|e| e.items_available.to_i == 0}
    
    respond_to do |format|
      format.xml  { render :xml => @warehouses }
      format.fxml  { render :fxml => @warehouses }
    end
  end
  
end