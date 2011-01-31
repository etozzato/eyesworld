class WarehousesController < ApplicationController
  
  before_filter :login_required
  
  def index
    @warehouses = Warehouse.all(:conditions => ["user_id = ? AND items > 0", current_user.id], :include => :model)
    # @warehouses = Warehouse.find_by_sql(["SELECT orders.model_id, sum(orders.items_received) as items_available, min(orders.id) as id, min(orders.maker_id) as maker_id FROM orders WHERE orders.user_id = ? AND (order_date BETWEEN ? AND ?) GROUP BY orders.model_id", current_user.id, "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"])
    # 
    # stocks = Warehouse.find_by_sql(["SELECT stocks.model_id, sum(stocks.items) AS items_available, min(stocks.id) AS id, min(stocks.maker_id) AS maker_id FROM stocks WHERE stocks.user_id = ? AND (created_at BETWEEN ? AND ?) GROUP BY stocks.model_id", current_user.id, "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"])
    # 
    # w_ids = @warehouses.map(&:id)
    # stocks.each do |s|
    #     w = @warehouses.detect {|el| el.model_id == s.model_id}
    #     if w
    #       w.items_available = w.items_available.to_i + s.items_available.to_i
    #     else
    #       while w_ids.include?(s.id)
    #         s.id = rand(10000)
    #       end
    #       @warehouses << s
    #     end
    # end
    # 
    # sales = Sale.find_by_sql(["SELECT sales.model_id, sum(sales.items_sold) as sold FROM sales WHERE sales.user_id = ? AND (sale_date BETWEEN ? AND ?) GROUP BY sales.model_id", current_user.id, "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"])
    # 
    # returns = Return.find_by_sql(["SELECT returns.model_id, sum(returns.items_returned) as returned FROM returns WHERE returns.user_id = ? AND (return_date BETWEEN ? AND ?) GROUP BY returns.model_id", current_user.id, "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"])
    # 
    # sales.each do |s|
    #   w = @warehouses.detect {|el| el.model_id == s.model_id}
    #   w.items_available = w.items_available.to_i - s.sold.to_i if w
    # end
    # 
    # returns.each do |s|
    #   w = @warehouses.detect {|el| el.model_id == s.model_id}
    #   w.items_available = w.items_available.to_i - s.returned.to_i if w
    # end
    # 
    # @warehouses = @warehouses.sort_by { |el| el.model.name }
    # 
    # @warehouses.delete_if {|e| e.items_available.to_i == 0}
    
    @warehouses = @warehouses.sort_by { |el| el.model.name }
    
    respond_to do |format|
      format.xml  { render :xml => @warehouses }
      format.fxml  { render :fxml => @warehouses }
    end
  end
  
end