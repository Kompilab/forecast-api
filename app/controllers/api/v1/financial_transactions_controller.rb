class Api::V1::FinancialTransactionsController < Api::V1::ApiController
  def index
    render json: FinancialTransaction.order(updated_at: :desc)
  end

  def show
  end

  def create
    transaction = current_user.financial_transactions.new(financial_transactions_params)

    if transaction.save
      render json: transaction,
             status: :created
    else
      render json: {
                 errors: transaction.try(:errors),
                 messages: transaction.try(:errors).try(:full_messages)
             },
             status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def financial_transactions_params
    params.fetch(:financial_transactions, {}).permit(:description, :notes, :amount, :transaction_type, :transaction_date, :category_id, :source, :payment_method)
  end
end
