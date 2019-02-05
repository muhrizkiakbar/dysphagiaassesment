class ClarificationTransactionsController < ApplicationController
  before_action :set_clarification_transaction, only: [:show, :edit, :update, :destroy]

  # GET /clarification_transactions
  # GET /clarification_transactions.json
  def index
    @clarification_transactions = ClarificationTransaction.all
  end

  # GET /clarification_transactions/1
  # GET /clarification_transactions/1.json
  def show
  end

  # GET /clarification_transactions/new
  def new
    @clarification_transaction = ClarificationTransaction.new
  end

  # GET /clarification_transactions/1/edit
  def edit
  end

  # POST /clarification_transactions
  # POST /clarification_transactions.json
  def create
    status = false
    @transaction = Transaction.find(params[:transaction_id])
    params[:clarification_transaction][:clarification].each do |clarification|
      @clarification_transaction = ClarificationTransaction.new
      @clarification_transaction.tran = @transaction
      @clarification_transaction.clarification = clarification
      if @clarification_transaction.save
        status = true
      else
        status = false
      end

      puts clarification
    end
    
    if status
      redirect_to transaction_path(@transaction), notice: 'Successfully.'
    else
      redirect_to transaction_path(@transaction), notice: 'Failed.'
    end
  end

  # PATCH/PUT /clarification_transactions/1
  # PATCH/PUT /clarification_transactions/1.json
  def update
    respond_to do |format|
      if @clarification_transaction.update(clarification_transaction_params)
        format.html { redirect_to @clarification_transaction, notice: 'Clarification transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @clarification_transaction }
      else
        format.html { render :edit }
        format.json { render json: @clarification_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clarification_transactions/1
  # DELETE /clarification_transactions/1.json
  def destroy
    @clarification_transaction.destroy
    respond_to do |format|
      format.html { redirect_to clarification_transactions_url, notice: 'Clarification transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clarification_transaction
      @clarification_transaction = ClarificationTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clarification_transaction_params
      params.require(:clarification_transaction).permit(:transaction_id, :clarification)
    end
end
