class Api::V1::BankStatementsController < Api::V1::ApiController
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
end
