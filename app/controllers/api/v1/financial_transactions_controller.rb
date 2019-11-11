require 'events/logger'

class Api::V1::FinancialTransactionsController < Api::V1::ApiController
  def index
    render json: all_transactions
  end

  def show
  end

  def create
    # transaction = current_user.financial_transactions.new(financial_transactions_params)

    # todo create transactions for one user first for iOS integration.
    transaction = temp_user.financial_transactions.new(financial_transactions_params)

    if transaction.save
      Events::Logger.new(
          event_name: 'transaction.create',
          description: "New transaction created, id: #{transaction.id}",
          event_date: Date.today,
          event_type: 'transaction',
          user_id: temp_user.id
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
               income: user_transactions.total_income,
               expenses: user_transactions.total_expenses
           },
           status: :ok
  end

  private

  def temp_user
    User.find_by(id: 1)
  end

  def financial_transactions_params
    params.fetch(:financial_transactions, {}).permit(
        :description,
        :notes,
        :amount,
        :transaction_type,
        :transaction_date,
        :category_id,
        :source,
        :payment_method
    )
  end

  def user_transactions
    # current_user.financial_transactions
    temp_user.financial_transactions
  end

  def all_transactions
    format_category_name(user_transactions.order(updated_at: :desc))
  end

  def format_category_name(transactions)
    transactions.map do |t|
      tx = t.as_json
      tx.merge({
        category_name: t.category.try(:name)
        # parent_category_name: t.category.parent_category.try(:name)
      })
    end
  end
end
