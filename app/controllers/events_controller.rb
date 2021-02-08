class EventsController < ApplicationController
    def index
        @events = Event.where(visible: true).order(:order)
        @setting = Setting.all.first
        render 'index'
    end

    def show_one
        @event = Event.find(1)

        @meta = @event.event_ones.first

        if @event.end_date < Time.now
            redirect_to "/"
        else
            render "event1"
        end
    end

    def show_two
        @event = Event.find(2)

        # @meta = @event.event_twos.first

        if @event.end_date < Time.now
            redirect_to "/"
        else
            render "event2"
        end
    end

    def show_three
        @event = Event.find(3)

        @meta = @event.event_threes.first

        if @event.end_date < Time.now
            redirect_to "/"
        else
            render "event3"
        end
    end

    def destroy_background
        @meta = EventOne.all.first

        respond_to do |format|
            if (@meta.nil?)
                format.js { render inline: "alert('오류 발생')" }
            else
                @meta.image_background.purge
                @meta.save!

                format.js { render inline: "alert('삭제 완료')" }
            end
        end
    end

    def finished
        render "thank"
    end

    def apply_one
        @event = Event.find(1)

        @meta = @event.event_ones.first
        
        if @event.end_date < Time.now
            redirect_to "/"
        else
            render "apply1"
        end
    end

    def apply_two
        @event = Event.find(2)

        @selected_prize = params[:prize].to_i
        # @meta = @event.event_twos.first

        if @event.end_date < Time.now
            redirect_to "/"
        else
            render "apply2"
        end
    end

    def apply_three
        @event = Event.find(3)

        @meta = @event.event_threes.first

        if @event.end_date < Time.now
            redirect_to "/"
        else
            render "apply3"
        end
    end

end
