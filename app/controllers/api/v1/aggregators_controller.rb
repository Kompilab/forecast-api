class Api::V1::AggregatorsController < Api::V1::ApiController
  def index
    render json: compute_parameters,
           status: :ok
  end

  private

  def compute_parameters
    {
        total_lent: user_lend_borrows.lent.sum(:amount),
        total_borrowed: user_lend_borrows.borrowed.sum(:amount),
    }
  end

  def user_lend_borrows
    current_user.lend_borrows
  end
end
