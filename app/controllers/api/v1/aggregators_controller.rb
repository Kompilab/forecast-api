class Api::V1::AggregatorsController < Api::V1::ApiController
  def index
    render json: compute_parameters,
           status: :ok
  end

  private

  def compute_parameters
    {
        total_lent: temp_user.lend_borrows.lent.sum(:amount),
        total_borrowed: temp_user.lend_borrows.borrowed.sum(:amount),
        contacts: user_contacts
    }
  end

  def user_contacts
    # @contacts = current_user.contacts
    temp_user.contacts.map do |c|
      cx = c.as_json
      cx.merge({
         lendborrow_count: c.lend_borrows.count,
      })
    end
  end

  def temp_user
    User.find_by(id: 1)
  end
end
