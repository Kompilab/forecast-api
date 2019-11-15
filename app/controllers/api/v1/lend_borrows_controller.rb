class Api::V1::LendBorrowsController < Api::V1::ApiController
  before_action :set_lend_borrow, only: [:show, :update, :destroy]
  before_action :set_user_lend_borrows, only: [:index]

  # GET /lend_borrows
  def index
    render json: @lend_borrows
  end

  # GET /lend_borrows/1
  def show
    render json: @lend_borrow
  end

  # POST /lend_borrows
  def create
    lend_borrow = temp_user.lend_borrows.new(lend_borrow_params)

    if lend_borrow.save
      render json: lend_borrow, status: :created
    else
      render json: {
                 errors: lend_borrow.try(:errors),
                 messages: lend_borrow.try(:errors).try(:full_messages)
             },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lend_borrows/1
  def update
    if @lend_borrow.update(lend_borrow_params)
      render json: @lend_borrow
    else
      render json: @lend_borrow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lend_borrows/1
  def destroy
    @lend_borrow.destroy
  end

  private
    def temp_user
      User.find_by(id: 1)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_lend_borrow
      @lend_borrow = LendBorrow.find(params[:id])
    end

  def set_user_lend_borrows
    # @lend_borrows = current_user.lend_borrows
    @lend_borrows = temp_user.lend_borrows
  end

    # Only allow a trusted parameter "white list" through.
    def lend_borrow_params
      params.require(:lend_borrow).permit(:amount, :notes, :date_due, :date, :status, :lb_type, :contact_id)
    end
end
