module Transactions
  class ImportStatement
    attr_accessor :user, :bank_key, :file_path, :password

    def initialize(user, data = {})
      @user = user
      @bank_key = data[:bank_key]
      @file_path = data[:file].tempfile #|| Rails.root.join('lib/test_data/AFS-April-2019-0033268124.xls')
      @password = data[:password]
    end

    def store
      crunched_data = crunch

      if crunched_data[:status] == 200 && crunched_data.dig(:data, :transactions).present?
        transactions = crunched_data.dig(:data, :transactions)
        mapped_transactions = transactions.map{|tx| tx_mappings tx}

        begin
          User.transaction do
            user.financial_transactions.create!(mapped_transactions)
            user.bank_statements.create!(statement_mappings(crunched_data.dig(:data)))
          end


          Events::Logger.new(
              event_name: 'transaction.import',
              description: "Imported #{transactions.count} transactions from your #{bank_key} statement.",
              event_date: Date.today,
              event_type: 'transaction',
              user_id: user.id
          ).log
        rescue => e
          {status: 500, message: "Error occurred saving imported transactions: #{e}"}
        end
      end

      crunched_data
    end

    def crunch
      NgBankParser::Router.parse(bank_key, file_path, password)
    end

    private

    def tx_mappings(data)
      {
          user_id: user.id,
          category_id: predict_category(data[:remarks]),
          amount: data[:amount],
          description: data[:remarks],
          transaction_date: data[:date],
          transaction_type: data[:type],
          source: bank_key,
          payment_method: 'card',
          notes: "ref: #{data[:ref]}, balance: #{data[:balance]}"
      }
    end

    def predict_category(text)
      if text.downcase.include? 'airtime'
        Category.by_name('mobile phone').try(:id)
      else
        Category.by_name('uncategorized').try(:id)
      end
    end

    def statement_mappings(data)
      {
          account_name: data[:account_name],
          account_number: data[:account_number][-4..-1],
          bank_name: data[:bank_name],
          bank_key: bank_key,
          from_date: data[:from_date],
          to_date: data[:to_date],
          transactions: data[:transactions]
      }
    end
  end
end
