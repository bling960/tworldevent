class EventsController < ApplicationController
    def index
        @events = Event.where(visible: true).order(end: :desc)
        render 'index'
    end

    def show
        event_id = params[:id]
        @event = Event.find(event_id)
        render "event" + event_id
    end

    def finished
        render "thank"
    end

    def apply
        event_id = params[:id]
        @event = Event.find(event_id)
        render "apply" + event_id
    end

    def verify_user_one
        phone = params[:user_one][:phone]

        @user = UserOne.where(phone: phone)

        if !@user.nil? && @user.submitted
            @error = "이미 존재하는 휴대폰 번호입니다."
        elsif @user.nil?
            @user = UserOne.new
            @user.phone = phone
        end

        code = rand.to_s[2..7]
        @user.submitted = false
        @user.code = code
        @user.save!

        render :nothing => true, :message => "success"
    end


    def create_user_one
        name = params[:user_one][:name]
        phone = params[:user_one][:phone]
        app1 = params[:user_one][:app1]
        app2 = params[:user_one][:app2]
        app3 = params[:user_one][:app3]
        app4 = params[:user_one][:app4]
        app5 = params[:user_one][:app5]
        naverid = params[:user_one][:naverid]
        url = params[:user_one][:url]
        agreed = params[:user_one][:agreed]

        if !true?(app1) && !true?(app2) && !true?(app3) && !true?(app4) && !true?(app5)
            @error = "앱을 선택해주세요."
        elsif name.blank? || naverid.blank? || url.blank? || agreed.blank?
            @error = "입력되지 않은 정보가 있습니다."
        elsif !true?(agreed)
            @error = "개인정보 수집 및 이용에 동의해주세요."
        elsif phone.blank?
            @error = "휴대폰번호 인증을 해주세요."
        else
            @user = UserOne.find(phone: phone)
            if @user.nil?
                @error= "휴대폰번호 인증을 해주세요."
            else
                @user.name = name
                @user.app = app
                @user.naverid = naverid
                @user.url = url
                @user.submitted = true

                @user.save!

            end
        end
        
        respond_to do |format|
            if @error.nil? || @error.blank?
                format.html { redirect_to "/finished" }
            else
                format.js { render inline: "alert('" + @error + "')" }
            end
        end

    end

    def true?(obj)
        obj.to_s.downcase == "true" || obj.to_s.downcase == "1"
    end
end
