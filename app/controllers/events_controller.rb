class EventsController < ApplicationController
    def index
        @events = Event.where(visible: true).order(end: :desc)
        render 'index'
    end
end
