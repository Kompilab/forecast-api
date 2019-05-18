require 'events/logger'

class Api::V1::FinancialTransactionsController < Api::V1::ApiController
  def index
    render json: all_transactions
  end

  def show
  end

  def create
    transaction = current_user.financial_transactions.new(financial_transactions_params)

    if transaction.save
      Events::Logger.new(
          event_name: 'transaction.create',
          description: "New transaction created, id: #{transaction.id}",
          event_date: Date.today,
          event_type: 'transaction',
          user_id: current_user.id
      ).log

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

  def payment_methods
    render json: FinancialTransaction::PAYMENT_METHODS,
           status: :ok
  end

  def calculations
    render json: {
               income: FinancialTransaction.total_income,
               expenses: FinancialTransaction.total_expenses
           },
           status: :ok
  end

  private

  def financial_transactions_params
    params.fetch(:financial_transactions, {}).permit(:description, :notes, :amount, :transaction_type, :transaction_date, :category_id, :source, :payment_method)
  end

  def all_transactions
    format_category_name(FinancialTransaction.order(updated_at: :desc))
  end

  def format_category_name(transactions)
    transactions.map do |t|
      tx = t.as_json
      tx.merge({
        category_name: t.category.try(:name),
        parent_category_name: t.category.parent_category.try(:name)
      })
    end
  end
end
