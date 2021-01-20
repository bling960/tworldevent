class UserOnesController < ApplicationController
    def export_csv
        respond_to do |format|
           format.csv { send_data UserOne.to_csv }
        end
    end

    def destroy_all
        UserOne.destroy_all
    end
    
    def submit_user_one
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
        elsif name.blank? || naverid.blank? || url.blank? || agreed.blank? || phone.blank?
            @error = "입력되지 않은 정보가 있습니다."
        elsif !phone.start_with?("010")
            @error = "올바른 휴대폰 번호를 입력해주세요."
        elsif !true?(agreed)
            @error = "개인정보 수집 및 이용에 동의해주세요."
        else
            @user = UserOne.where(phone: phone).first

            if !@user.nil? && @user.submitted == true
                @error = "이미 응모 완료하셨습니다."
            else
                @user = UserOne.new
                @user.event_id = 1

                @user.name = name
                @user.phone = phone
                @user.app1 = app1
                @user.app2 = app2
                @user.app3 = app3
                @user.app4 = app4
                @user.app5 = app5
                @user.naverid = naverid
                @user.url = url
                @user.submitted = true

                @user.save!
            end
        end
        
        respond_to do |format|
            if @error.nil? || @error.blank?
                format.js { render inline: "window.location = '/finished'" }
            else
                format.js { render inline: "alert('" + @error + "')" }
            end
        end

    end

    def true?(obj)
        obj.to_s.downcase == "true" || obj.to_s.downcase == "1"
    end

end
