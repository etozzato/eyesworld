class StatController < ApplicationController
  layout 'simple'

  def index
    @last = {}
    user = current_user
    @last[:order]     = Order.first(:select => 'order_date', :conditions => ["user_id = ?", user.id], :order => "order_date DESC")
    @last[:increment] = Order.first(:select => 'increments.created_at',
                                    :conditions => ["user_id = ?", user.id],
                                    :joins => "INNER JOIN increments ON increments.order_id = orders.id",
                                    :order => "increments.created_at DESC")
    @last[:sale]      = Sale.first(:conditions => ["user_id = ?", user.id], :order => "sale_date DESC")

    @total = {}
    @total[:order] = Order.first(:select => 'SUM(items_required), SUM(total), SUM(items_received), SUM(items_received*price)',
                                 :conditions => ["user_id = ? AND order_date >= ?", user.id, "#{Time.now.year}-01-01"])
    @total[:sale] = Sale.first(:select => 'SUM(items_sold)',
                               :conditions => ["user_id = ? AND sale_date >= ?", user.id, "#{Time.now.year}-01-01"])

    @total[:return] = Return.first(:select => 'SUM(items_returned), SUM(total)',
                                   :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    # orders per maker :)                                   
    opmk = Order.hash_all('maker_id',
                                 :select => 'SUM(items_required), SUM(total)/SUM(items_required),maker_id',
                                 :group => 'maker_id',
                                 #:order => 'SUM(items_required) DESC',
                                 :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    makers = Maker.hash_all('id', :ar_column => 'name')
    @order_per_maker = (opmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(items_required)']}",makers[k]]}).sort_by {|el| el[1]}
    @avg_usd_per_maker = (opmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(total)/SUM(items_required)'].to_f.round(2)} EUR",makers[k]]}).sort_by {|el| el[1]}

    # orders per model!
    opmd = Order.hash_all('model_id',
                                 :select => 'SUM(items_required), SUM(total)/SUM(items_required),model_id',
                                 :group => 'model_id',
                                 #:order => 'SUM(items_required) DESC',
                                 :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    models = Model.hash_all('id', :ar_column => 'name')
    @order_per_model= (opmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(items_required)']}",models[k]]}).sort_by {|el| el[1]}
    @avg_usd_per_model = (opmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(total)/SUM(items_required)'].to_f.round(2)} EUR",models[k]]}).sort_by {|el| el[1]}
    
    # sale per maker
    spmk = Sale.hash_all('maker_id',
                        :select => 'SUM(items_sold),maker_id',
                        :group => 'maker_id',
                        :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    @sales_per_maker = (spmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(items_sold)']}",makers[k]]}).sort_by {|el| el[1]}
    
    # sale per model
    spmd = Sale.hash_all('model_id',
                        :select => 'SUM(items_sold),model_id',
                        :group => 'model_id',
                        :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    @sales_per_model = (spmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(items_sold)']}",models[k]]}).sort_by {|el| el[1]}
    
    # warehouse! 
    wpmk = Warehouse.hash_all('maker_id',
                              :select => 'SUM(items),maker_id',
                              :group => 'maker_id',
                              :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])

    @warehouse_per_maker = (wpmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(items)']}",makers[k]]}).sort_by {|el| el[1]}            

    wpmd = Warehouse.hash_all('model_id',
                              :select => 'SUM(items),model_id',
                              :group => 'model_id',
                              :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])

    @warehouse_per_model = (wpmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(items)']}",models[k]]}).sort_by {|el| el[1]}            
  end

  def list
    @users = User.all
  end
  
  def show
    @users = User.all
    @user = User.find(params[:id])
    Budget.sync(@user)
    @last = {}
    user = @user
    @last[:order]     = Order.first(:select => 'order_date', :conditions => ["user_id = ?", user.id], :order => "order_date DESC")
    @last[:increment] = Order.first(:select => 'increments.created_at',
                                    :conditions => ["user_id = ?", user.id],
                                    :joins => "INNER JOIN increments ON increments.order_id = orders.id",
                                    :order => "increments.created_at DESC")
    @last[:sale]      = Sale.first(:conditions => ["user_id = ?", user.id], :order => "sale_date DESC")

    @total = {}
    @total[:order] = Order.first(:select => 'SUM(items_required), SUM(total), SUM(items_received), SUM(items_received*price)',
                                 :conditions => ["user_id = ? AND order_date >= ?", user.id, "#{Time.now.year}-01-01"])
    @total[:sale] = Sale.first(:select => 'SUM(items_sold)',
                               :conditions => ["user_id = ? AND sale_date >= ?", user.id, "#{Time.now.year}-01-01"])

    @total[:return] = Return.first(:select => 'SUM(items_returned), SUM(total)',
                                   :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    # orders per maker :)                                   
    opmk = Order.hash_all('maker_id',
                                 :select => 'SUM(items_required), SUM(total)/SUM(items_required),maker_id',
                                 :group => 'maker_id',
                                 #:order => 'SUM(items_required) DESC',
                                 :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    makers = Maker.hash_all('id', :ar_column => 'name')
    @order_per_maker = (opmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(items_required)']}",makers[k]]}).sort_by {|el| el[1]}
    @avg_usd_per_maker = (opmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(total)/SUM(items_required)'].to_f.round(2)} EUR",makers[k]]}).sort_by {|el| el[1]}

    # orders per model!
    opmd = Order.hash_all('model_id',
                                 :select => 'SUM(items_required), SUM(total)/SUM(items_required),model_id',
                                 :group => 'model_id',
                                 #:order => 'SUM(items_required) DESC',
                                 :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    models = Model.hash_all('id', :ar_column => 'name')
    @order_per_model= (opmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(items_required)']}",models[k]]}).sort_by {|el| el[1]}
    @avg_usd_per_model = (opmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(total)/SUM(items_required)'].to_f.round(2)} EUR",models[k]]}).sort_by {|el| el[1]}
    
    # sale per maker
    spmk = Sale.hash_all('maker_id',
                        :select => 'SUM(items_sold),maker_id',
                        :group => 'maker_id',
                        :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    @sales_per_maker = (spmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(items_sold)']}",makers[k]]}).sort_by {|el| el[1]}
    
    # sale per model
    spmd = Sale.hash_all('model_id',
                        :select => 'SUM(items_sold),model_id',
                        :group => 'model_id',
                        :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    @sales_per_model = (spmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(items_sold)']}",models[k]]}).sort_by {|el| el[1]}
    
    # warehouse! 
    wpmk = Warehouse.hash_all('maker_id',
                              :select => 'SUM(items),maker_id',
                              :group => 'maker_id',
                              :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])

    @warehouse_per_maker = (wpmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(items)']}",makers[k]]}).sort_by {|el| el[1]}            

    wpmd = Warehouse.hash_all('model_id',
                              :select => 'SUM(items),model_id',
                              :group => 'model_id',
                              :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])

    @warehouse_per_model = (wpmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(items)']}",models[k]]}).sort_by {|el| el[1]}
  end

end