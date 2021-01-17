class UserOnesController < ApplicationController

    def verify_user_one
        phone = params[:phone_number]

        @user = UserOne.where(phone: phone).first

        if phone.blank?
            @error = "휴대폰번호를 입력해주세요."
        elsif !@user.nil? || !@user.blank?
            if @user.submitted == true
                # don't allow submission
                @error = "이미 존재하는 휴대폰 번호입니다."
            else
                # send again the code
               @user.initialize_code()
            end
        elsif @user.nil?
            # create user
            @user = UserOne.new
            @user.phone = phone
            code = rand.to_s[2..7]
            @user.submitted = false
            @user.verified = false
            @user.code = code
            @user.event_id = 1
            @user.save!

            # send the code
            @user.initialize_code()
        end

        respond_to do |format|
            if @error.nil? || @error.blank?
                format.js { render "verify.js.erb" }
            else
                format.js { render inline: "alert('" + @error + "')" }
            end
        end
    end

    def confirm_user_one
        code = params[:code]
        phone = params[:phone_num]

        @user = UserOne.where(phone: phone).first

        if code.blank?
            @error = "인증번호를 입력해주세요."
        elsif @user.nil?
            @error = "<인증> 버튼을 눌러 인증번호 전송을 해주세요."
        elsif @user.code.nil? || @user.code.blank?
            @error = "인증번호가 만료되었습니다. <인증> 버튼을 다시 한 번 클릭해주세요."
        elsif @user.code != code
            @error = "잘못된 인증번호입니다."
        elsif @user.code == code
            # update user
            @user.verified = true
            @user.save!

            # send the code
            @user.initialize_code()
        end

        respond_to do |format|
            if @error.nil? || @error.blank?
                format.js { render inline: "alert('인증이 완료되었습니다.')" }
            else
                format.js { render inline: "alert('" + @error + "')" }
            end
        end
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
            @user = UserOne.where(phone: phone).first
            if @user.nil? || @user.verified == false
                @error = "휴대폰번호 인증을 해주세요."
            elsif @user.submitted == true
                @error = "이미 응모 완료하셨습니다."
            else
                @user.name = name
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
