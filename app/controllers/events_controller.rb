class EventsController < ApplicationController
    def index
    
    end

    def new
        event = 
    end

    def create
    
    end

    def show
    
    end

    private

        def event_params
            params.require(:events).permit(:title, :description, :date, :location)
        end
end
