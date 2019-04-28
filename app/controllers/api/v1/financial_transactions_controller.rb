class Api::V1::FinancialTransactionsController < Api::V1::ApiController
  def index
    render json: FinancialTransaction.order(updated_at: :desc)
  end

  def show
  end

  def create
    new_ft = current_user.financial_transactions.new(financial_transactions_params)

    if new_ft.save
      render json: new_ft,
             status: :ok
    else
      render json: new_ft.errors,
             status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def financial_transactions_params
    params.require(:financial_transactions).permit(:item, :details, :amount, :transaction_type, :transaction_date, :category_id)
  end
end
