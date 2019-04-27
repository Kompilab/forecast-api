module Events
  class Logger
    attr_accessor :event_name, :description, :event_date, :event_type, :user_id

    def initialize(event_name:, description:, event_date:, event_type:, user_id:)
      @event_name = event_name
      @description = description
      @event_date = event_date
      @event_type = event_type
      @user_id = user_id
    end

    def log
      puts 'Got here'
      new_event = Event.new({
        event_name: event_name,
        description: description,
        event_date: event_date,
        event_type: event_type,
        user_id: user_id
      })

      if new_event.save!
        { status: true, message: nil }
      else
        { status: false, message: new_event.errors }
      end
    end
  end
end
