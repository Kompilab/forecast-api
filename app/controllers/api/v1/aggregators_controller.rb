class Api::V1::AggregatorsController < Api::V1::ApiController
  def index
    render json: compute_parameters,
           status: :ok
  end

  private

  def compute_parameters
    {
        total_lent: temp_user.lend_borrows.lent.sum(:amount),
        total_borrowed: temp_user.lend_borrows.borrowed.sum(:amount)
    }
  end

  def temp_user
    User.find_by(id: 1)
  end
end
