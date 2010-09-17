class ReportsController < ApplicationController
  require 'csv'
  def index
  end
  
  def ordini
    
    options = {:include => [:user, :maker, :model]}
    
    if params[:id] && user = User.find_by_id(params[:id])
      options.merge!(:conditions => ["user_id = ?", user.id])
    end
    
    if params[:marchio]
      options.merge!(:select => 'orders.*, 0 AS id, SUM(items_required) AS items_required, SUM(items_received) AS items_received, SUM(total) AS total, SUM(confidential_price) AS confidential_price, MAX(order_date) AS order_date', :group => 'model_id')
    elsif params[:fornitore]
      options.merge!(:select => 'orders.*, 0 AS id, SUM(items_required) AS items_required, SUM(items_received) AS items_received, SUM(total) AS total, " - " AS confidential_price, " - " AS model_id ', :group => 'maker_id')
    end

    @orders = Order.all(options)

    csv_string = CSV.generate do |csv|
      csv << [
        'id_ordine',
        'ordinato', 
        'ricevuto', 
        'prezzo_unitario', 
        'prezzo_totale',
        'sconto %',
        'prezzo_confidenziale',
        'data_ordine',
        'id_negozio',
        'negozio',
        'fornitore',
        'modello'
      ]
      @orders.each do |o|
        csv << [
          o.id, 
          o.items_required, 
          o.items_received,
          o.price,
          o.total,
          o.discount,
          o.confidential_price,
          o.order_date,
          o.user_id,
          o.user.username,
          o.maker.name,
          o.model ? o.model.name : ' - '
        ]
      end
    end
    render :text => csv_string
  end
  
end