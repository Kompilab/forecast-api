require 'events/logger'

class Api::V1::ParentCategoriesController < Api::V1::ApiController
  before_action :set_parent_category, only: [:show, :update, :destroy]

  def index
    @parent_categories = ParentCategory.all
    render json: @parent_categories, status: :ok
  end

  def show
    render json: @parent_category, status: :ok
  end

  def create
    parent_category = ParentCategory.new(parent_category_params)

    if parent_category.save
      Events::Logger.new(
          event_name: 'parent_category.create',
          description: "New parent category created - #{parent_category.name}",
          event_date: Date.today,
          event_type: 'parent_category',
          user_id: current_user.id
      ).log

      render json: parent_category, status: :created
    else
      render json: {
                      errors: parent_category.try(:errors),
                      messages: parent_category.try(:errors).try(:full_messages)
                    },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parent_categories/1
  def update
    if @parent_category.update(parent_category_params)
      render json: @parent_category
    else
      render json: {
                      errors: @parent_category.try(:errors),
                      messages: @parent_category.try(:errors).try(:full_messages)
                    },
             status: :unprocessable_entity
    end
  end

  # DELETE /parent_categories/1
  def destroy
    @parent_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent_category
      @parent_category = ParentCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parent_category_params
      params.fetch(:parent_category, {}).permit(:name)
    end
end
