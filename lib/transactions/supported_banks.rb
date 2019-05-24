module Transactions
  class SupportedBanks
    LIST = [
        {key: 'gtb', name: 'Guaranty Trust Bank', formats: '.xls, .xlsx'},
        {key: 'uba', name: 'United Bank for Africa', formats: '.pdf'},
        {key: 'firstbank', name: 'First Bank of Nigeria', formats: '.pdf'},
        {key: 'hb', name: 'Heritage Bank', formats: '.pdf'},
        {key: 'accessbank', name: 'Access Bank', formats: '.pdf'},
        {key: 'ecobank', name: 'Ecobank Nigeria', formats: '.pdf'}
    ]
  end
end
