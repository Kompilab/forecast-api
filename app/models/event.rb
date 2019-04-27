class Event < ApplicationRecord
  validates_presence_of :event_name, :description, :event_date, :event_type, :user_id
  before_save :set_user_id

  def set_user_id
    self.user_id = user_id || 0
  end
end
