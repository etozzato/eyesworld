class BudgetsController < ApplicationController
  # GET /budgets
  # GET /budgets.xml
  # GET /budgets.fxml
  def index
    @budgets = Budget.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @budgets }
      format.fxml  { render :fxml => @budgets }
    end
  end

  # GET /budgets/1
  # GET /budgets/1.xml
  # GET /budgets/1.fxml
  def show
    @budget = Budget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @budget }
      format.fxml  { render :fxml => @budget }
    end
  end

  # GET /budgets/new
  # GET /budgets/new.xml
  def new
    @budget = Budget.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @budget }
    end
  end

  # GET /budgets/1/edit
  def edit
    @budget = Budget.find(params[:id])
  end

  # POST /budgets
  # POST /budgets.xml
  # POST /budgets.fxml
  def create
    @budget = Budget.new(params[:budget])

    respond_to do |format|
      if @budget.save
        if @budget.year == Time.now.year
          @budget.user.update_attribute(:budget_id, @budget.id) if @budget.user.budget_id != @budget.id
        end
        flash[:notice] = 'Budget was successfully created.'
        format.html { redirect_to(@budget) }
        format.xml  { render :xml => @budget, :status => :created, :location => @budget }
        format.fxml  { render :fxml => @budget }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @budget.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @budget.errors }
      end
    end
  end

  # PUT /budgets/1
  # PUT /budgets/1.xml
  # PUT /budgets/1.fxml
  def update
    @budget = Budget.find(params[:id])
    @saved = @budget.update_attributes(params[:budget])
    if @budget.year == Time.now.year
      @budget.user.update_attribute(:budget_id, @budget.id) if @budget.user.budget_id != @budget.id
    end

    respond_to do |format|
      if @saved
        flash[:notice] = 'Budget was successfully updated.'
        format.html { redirect_to(@budget) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @budget }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @budget.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @budget.errors }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.xml
  # DELETE /budgets/1.fxml
  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to(budgets_url) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @budget }
    end
  end
end