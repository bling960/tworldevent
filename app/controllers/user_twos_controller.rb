class UserTwosController < ApplicationController

    def create_user_two
        
        if params[:user_two].nil? 
            @error = "경품을 선택해주세요"
        else
            prize = params[:user_two][:prize]
            if prize.blank?
                @error = "경품을 선택해주세요"
            end
        end

        respond_to do |format|
            if @error.nil? || @error.blank?
                format.js { render inline: "window.location = '/events/2/apply?prize=" + prize + "'"}
            else
                format.js { render inline: "alert('" + @error + "')" }
            end
        end

    end


    def verify_user_two
        phone = params[:phone_number]

        @user = UserTwo.where(phone: phone).first

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
            @user = UserTwo.new
            @user.event_id = 2
            @user.phone = phone
            code = rand.to_s[2..7]
            @user.submitted = false
            @user.verified = false
            @user.code = code
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

    def confirm_user_two
        code = params[:code]
        phone = params[:phone_num]

        @user = UserTwo.where(phone: phone).first

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

    def submit_user_two
        name = params[:user_two][:name]
        phone = params[:user_two][:phone]
        prize = params[:user_two][:prize]
        shop = params[:user_two][:shop]
        agreed = params[:user_two][:agreed]
        agreed2 = params[:user_two][:agreed2]

        if prize.blank?
            @error = "경품을 선택해주세요"
        elsif name.blank? || shop.blank? || agreed.blank? || agreed2.blank?
            @error = "입력되지 않은 정보가 있습니다."
        elsif !true?(agreed) || !true?(agreed)
            @error = "필수 약관에 동의해주세요."
        elsif phone.blank?
            @error = "휴대폰번호 인증을 해주세요."
        else
            @user = UserTwo.where(phone: phone).first
            if @user.nil? || @user.verified == false
                @error = "휴대폰번호 인증을 해주세요."
            elsif @user.submitted == true
                @error = "이미 응모 완료하셨습니다."
            else
                @user.name = name
                @user.prize = prize
                @user.shop = shop
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
