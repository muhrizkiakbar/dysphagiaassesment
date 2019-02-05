class ConfirmTransactionsController < ApplicationController
  before_action :set_confirm_transaction, only: [:show, :edit, :update, :destroy]

  # GET /confirm_transactions
  # GET /confirm_transactions.json
  def index
    @confirm_transactions = ConfirmTransaction.all
  end

  # GET /confirm_transactions/1
  # GET /confirm_transactions/1.json
  def show
  end

  # GET /confirm_transactions/new
  def new
    @confirm_transaction = ConfirmTransaction.new
  end

  # GET /confirm_transactions/1/edit
  def edit
  end

  # POST /confirm_transactions
  # POST /confirm_transactions.json
  def create
    @transaction = Transaction.find(params[:transaction_id])
    @confirm_transaction = ConfirmTransaction.new
    @confirm_transaction.tran = @transaction
    if (params[:commit]=="Berhasil")
      status = true
    else
      status = false

    end
    @confirm_transaction.status = status

    puts status 
    
    if @confirm_transaction.save
      redirect_to transaction_path(@transaction), notice: 'Successfully.'
    else
      redirect_to transaction_path(@transaction), notice: 'Failed.'
    end

   
  end

  # PATCH/PUT /confirm_transactions/1
  # PATCH/PUT /confirm_transactions/1.json
  def update
    respond_to do |format|
      if @confirm_transaction.update(confirm_transaction_params)
        format.html { redirect_to @confirm_transaction, notice: 'Confirm transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirm_transaction }
      else
        format.html { render :edit }
        format.json { render json: @confirm_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirm_transactions/1
  # DELETE /confirm_transactions/1.json
  def destroy
    @confirm_transaction.destroy
    respond_to do |format|
      format.html { redirect_to confirm_transactions_url, notice: 'Confirm transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirm_transaction
      @confirm_transaction = ConfirmTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirm_transaction_params
      params.require(:confirm_transaction).permit(:transaction_id, :status)
    end
end
