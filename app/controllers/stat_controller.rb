class StatController < ApplicationController
  layout 'simple'
  #before_filter :login_required
  
  def index
    @last = {}
    @last[:order]     = Order.first(:select => 'order_date', :conditions => ["user_id = ?", current_user.id], :order => "order_date DESC")
    @last[:increment] = Order.first(:select => 'increments.created_at',
                                    :conditions => ["user_id = ?", current_user.id],
                                    :joins => "INNER JOIN increments ON increments.order_id = orders.id",
                                    :order => "increments.created_at DESC")
    @last[:sale]      = Sale.first(:conditions => ["user_id = ?", current_user.id], :order => "sale_date DESC")
    
    @total = {}
    @total[:order] = Order.first(:select => 'SUM(items_required), SUM(total), SUM(items_received), SUM(items_received*price)', 
                                 :conditions => ["user_id = ? AND order_date >= ?", current_user.id, "#{Time.now.year}-01-01"])
    @total[:sale] = Sale.first(:select => 'SUM(items_sold)', 
                               :conditions => ["user_id = ? AND sale_date >= ?", current_user.id, "#{Time.now.year}-01-01"])

    @total[:return] = Return.first(:select => 'SUM(items_returned), SUM(total)',
                                   :conditions => ["user_id = ? AND created_at >= ?", current_user.id, "#{Time.now.year}-01-01"])
                                   
    opmk = Order.hash_all('maker_id',
                                 :select => 'SUM(items_required), SUM(total)/SUM(items_required),maker_id',
                                 :group => 'maker_id',
                                 #:order => 'SUM(items_required) DESC',
                                 :conditions => ["user_id = ? AND created_at >= ?", current_user.id, "#{Time.now.year}-01-01"])
    makers = Maker.hash_all('id', :ar_column => 'name')
    @order_per_maker = (opmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(items_required)']}",makers[k]]}).sort_by {|el| el[1]}
    @avg_usd_per_maker = (opmk.map{|k,v| ["#{makers[k]}: #{v.attributes['SUM(total)/SUM(items_required)']} EUR",makers[k]]}).sort_by {|el| el[1]}

    opmd = Order.hash_all('model_id',
                                 :select => 'SUM(items_required), SUM(total)/SUM(items_required),model_id',
                                 :group => 'model_id',
                                 #:order => 'SUM(items_required) DESC',
                                 :conditions => ["user_id = ? AND created_at >= ?", current_user.id, "#{Time.now.year}-01-01"])
    models = Model.hash_all('id', :ar_column => 'name')
    @order_per_model= (opmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(items_required)']}",models[k]]}).sort_by {|el| el[1]}
    @avg_usd_per_model = (opmd.map{|k,v| ["#{models[k]}: #{v.attributes['SUM(total)/SUM(items_required)']} EUR",models[k]]}).sort_by {|el| el[1]}
  end
end