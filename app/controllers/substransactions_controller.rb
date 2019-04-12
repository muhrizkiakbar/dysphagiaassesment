class SubstransactionsController < ApplicationController
  def new
  end

  def create
      
      @answerfind = Answer.find(params[:answer_id])
      @transactionfind = Transaction.find(params[:transaction_id])
      @newsubtransaction= Subtransaction.new
      @newsubtransaction.answer = @answerfind
      @newsubtransaction.tran = @transactionfind
      @newsubtransaction.save


      

      @transaction = Transaction.find(params[:transaction_id])
      @transaction.score = @transaction.score+@answerfind.value

      @decision = Decision.where(["begin_value <= ?",@transaction.score]).where(["end_value >= ?", @transaction.score]).first

      @transaction.decision= @decision
      @transaction.save


      respond_to do |format|
        format.html { redirect_to transaction_path(@transactionfind), notice: 'Successfuly saved.' }
        format.json { head :no_content }
      end
  end
end
