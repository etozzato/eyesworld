class StocksController < ApplicationController
  def index
    @stocks = Stock.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stocks }
      format.fxml  { render :fxml => @stocks }
    end
  end
end  