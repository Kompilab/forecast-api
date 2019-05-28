class Api::V1::BankStatementsController < Api::V1::ApiController
  def index
    render json: user_statements,
           status: :ok
  end

  def create
    crunched = Transactions::ImportStatement.new(current_user, import_params).store

    if crunched[:status] == 200
      render json: {
                 result: 'success',
                 messages: 'Successfully imported bank statement'
             },
             status: :created
    else
      render json: {
                 result: 'failed',
                 messages: crunched[:message]
             },
             status: :bad_request
    end
  end

  def supported_banks
    render json: Transactions::SupportedBanks::LIST,
           status: :ok
  end

  private

  def import_params
    params.fetch(:import, {}).permit(:bank_key, :file, :password)
  end

  def user_statements
    load_sum(current_user.bank_statements)
  end

  def load_sum(statements)
    statements.map do |statement|
      sums = sum_operation(statement.transactions)
      s = statement.as_json
      s.merge(sums)
    end
  end

  def sum_operation(transactions)
    credits = []
    debits = []

    transactions.map do |t|
      if t['type'] == 'credit'
        credits << t['amount']
      elsif t['type'] == 'debit'
        debits << t['amount']
      end
    end

    {total_credits: credits.sum, total_debits: debits.sum}
  end
end
