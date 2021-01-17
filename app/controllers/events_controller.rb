class EventsController < ApplicationController
    def index
        @events = Event.where(visible: true).order(end_date: :desc)
        @setting = Setting.all.first
        render 'index'
    end

    def show
        event_id = params[:id]
        @event = Event.find(event_id)

        if @event.end_date < Time.now
            redirect_to "/"
        else
            render "event" + event_id
        end
    end

    def finished
        render "thank"
    end

    def apply
        event_id = params[:id]
        @event = Event.find(event_id)
        render "apply" + event_id
    end
end
