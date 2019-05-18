# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_data = [
    {
        parent: {name: 'Income', description: ''},
        categories: [
            {name: 'Paycheck', description: ''},
            {name: 'Investment', description: ''},
            {name: 'Returned Purchase', description: ''},
            {name: 'Bonus', description: ''},
            {name: 'Interest Income', description: ''},
            {name: 'Reimbursement', description: ''},
            {name: 'Rental Income', description: ''},
            {name: 'Business', description: ''}
        ]
    },
    {
        parent: {name: 'Uncategorized', description: ''},
        categories: [
            {name: 'Cash & ATM', description: ''},
            {name: 'Check', description: ''}
        ]
    },
    {
        parent: {name: 'Entertainment', description: ''},
        categories: [
            {name: 'Arts', description: ''},
            {name: 'Music', description: ''},
            {name: 'Movies & DVDs', description: ''},
            {name: 'Newspaper & Magazines', description: ''}
        ]
    },
    {
        parent: {name: 'Education', description: ''},
        categories: [
            {name: 'Tuition', description: ''},
            {name: 'Student Loan', description: ''},
            {name: 'Books & Supplies', description: ''}
        ]
    },
    {
        parent: {name: 'Shopping', description: ''},
        categories: [
            {name: 'Clothing', description: ''},
            {name: 'Books', description: ''},
            {name: 'Electronics & Software', description: ''},
            {name: 'Hobbies', description: ''},
            {name: 'Sporting Goods', description: ''}
        ]
    },
    {
        parent: {name: 'Personal Care', description: ''},
        categories: [
            {name: 'Laundry', description: ''},
            {name: 'Hair', description: ''},
            {name: 'Spa & Massage', description: ''}
        ]
    },
    {
        parent: {name: 'Health & Fitness', description: ''},
        categories: [
            {name: 'Dentist', description: ''},
            {name: 'Doctor', description: ''},
            {name: 'Eye care', description: ''},
            {name: 'Pharmacy', description: ''},
            {name: 'Gym', description: ''},
            {name: 'Sports', description: ''}
        ]
    },
    {
        parent: {name: 'Kids', description: ''},
        categories: [
            {name: 'Activities', description: ''},
            {name: 'Allowance', description: ''},
            {name: 'Baby Supplies', description: ''},
            {name: 'Babysitter & Daycare', description: ''},
            {name: 'Child Support', description: ''},
            {name: 'Toys', description: ''}
        ]
    },
    {
        parent: {name: 'Food & Dining', description: ''},
        categories: [
            {name: 'Groceries', description: ''},
            {name: 'Coffee shops', description: ''},
            {name: 'Fast Food', description: ''},
            {name: 'Restaurants', description: ''},
            {name: 'Alcohol', description: ''}
        ]
    },
    {
        parent: {name: 'Gifts & Donations', description: ''},
        categories: [
            {name: 'Gift', description: ''},
            {name: 'Charity', description: ''}
        ]
    },
    {
        parent: {name: 'Investments', description: ''},
        categories: [
            {name: 'Deposit', description: ''},
            {name: 'Withdrawal', description: ''},
            {name: 'Dividends & Cap Gains', description: ''},
            {name: 'Buy', description: ''},
            {name: 'Sell', description: ''}
        ]
    },
    {
        parent: {name: 'Religion', description: ''},
        categories: [
            {name: 'Offering', description: ''},
            {name: 'Tithe', description: ''}
        ]
    },
    {
        parent: {name: 'Bills & Utilities', description: ''},
        categories: [
            {name: 'Television', description: ''},
            {name: 'Home Phone', description: ''},
            {name: 'Internet', description: ''},
            {name: 'Mobile Phone', description: ''},
            {name: 'Utilities', description: ''},
            {name: 'Electricity', description: ''},
            {name: 'Water', description: ''},
            {name: 'Waste Disposal', description: ''}
        ]
    },
    {
        parent: {name: 'Auto & Transport', description: ''},
        categories: [
            {name: 'Gas & Fuel', description: ''},
            {name: 'Parking', description: ''},
            {name: 'Service & Auto Parts', description: ''},
            {name: 'Auto Payment', description: ''},
            {name: 'Auto Insurance', description: ''}
        ]
    },
    {
        parent: {name: 'Travel', description: ''},
        categories: [
            {name: 'Air Travel', description: ''},
            {name: 'Road Travel', description: ''},
            {name: 'Water Travel', description: ''},
            {name: 'Hotel', description: ''},
            {name: 'Rental Car & Taxi', description: ''},
            {name: 'Vacation', description: ''}
        ]
    },
    {
        parent: {name: 'Fees & Charges', description: ''},
        categories: [
            {name: 'Service Fee', description: ''},
            {name: 'Late Fee', description: ''},
            {name: 'Finance Charge', description: ''},
            {name: 'ATM Fee', description: ''},
            {name: 'Bank Fee', description: ''},
            {name: 'Commissions', description: ''}
        ]
    },
    {
        parent: {name: 'Business Services', description: ''},
        categories: [
            {name: 'Advertising', description: ''},
            {name: 'Office Supplies', description: ''},
            {name: 'Printing', description: ''},
            {name: 'Shipping', description: ''},
            {name: 'Legal', description: ''}
        ]
    },
    {
        parent: {name: 'Taxes', description: ''},
        categories: [
            {name: 'Federal Tax', description: ''},
            {name: 'State Tax', description: ''},
            {name: 'Local Tax', description: ''},
            {name: 'Sales Tax', description: ''},
            {name: 'Property Tax', description: ''}
        ]
    }
]

if ParentCategory.count == 0
  categories_data.each do |data|
    parent = ParentCategory.find_or_create_by(data[:parent])
    parent.categories.create(data[:categories])
    print '.'
  end

  puts "\nDone seeding parent categories with sub categories."
end
