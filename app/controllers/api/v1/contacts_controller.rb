class Api::V1::ContactsController < Api::V1::ApiController
  before_action :set_contact, only: [:show, :update, :destroy]
  before_action :set_user_contacts, only: [:index]

  # GET /contacts
  def index
    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    contact = temp_user.contacts.new(contact_params)

    if contact.save
      render json: contact, status: :created
    else
      render json: {
                 errors: contact.try(:errors),
                 messages: contact.try(:errors).try(:full_messages)
             },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    def temp_user
      User.find_by(id: 1)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_user_contacts
      # @contacts = current_user.contacts
      @contacts = add_records(temp_user.contacts)
    end

    def add_records(contacts)
      contacts.map do |c|
        cx = c.as_json
        cx.merge({
            lendborrow_count: c.lend_borrows.count,
            total_lent: c.lend_borrows.lent.sum(:amount),
            total_borrowed: c.lend_borrows.borrowed.sum(:amount)
        })
      end
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :data)
    end
end
