class EventsController < ApplicationController 

    def index
    
    end

    def new
        @event = Event.new
    end

    def create
        event = current_user.event.build(event_params)
        if event.save
            flash[:success] = 'Event created!'
            redirect_to 'index'
        else
            flash[:errors] = event.errors.full_messages
            render 'new'
        end
    end

    def show
    
    end

    private

        def event_params
            params.require(:events).permit(:title, :description, :date, :location)
        end
end
