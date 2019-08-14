class EventsController < ApplicationController 
    before_action :logged_in_user, only: %i[new create show]
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        event = current_user.events.build(event_params)
        if event.save
            flash[:success] = 'Event created!'
            redirect_to events_path
        else
            flash[:errors] = event.errors.full_messages
            redirect_back(fallback_location: root_path)
        end
    end

    def show
        # @creator = User.find(Event.find(params[:id]).creator_id).user_name
        @creator = User.find(params[:id]).user_name
    end

    private

        def event_params
            params.require(:event).permit(:title, :description, :date, :location)
        end
end
