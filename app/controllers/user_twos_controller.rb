class UserTwosController < ApplicationController
    def export_csv
        respond_to do |format|
           format.csv { send_data UserTwo.to_csv }
        end
    end

    def destroy_all
        UserTwo.destroy_all
        redirect_to "/admin/user_twos"
    end

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

    def submit_user_two
        name = params[:user_two][:name]
        phone = params[:user_two][:phone]
        prize = params[:user_two][:prize]
        shop = params[:user_two][:shop]
        agreed = params[:user_two][:agreed]
        agreed2 = params[:user_two][:agreed2]

        if prize.blank?
            @error = "경품을 선택해주세요"
        elsif name.blank? || shop.blank? || agreed.blank? || agreed2.blank? || phone.blank?
            @error = "입력되지 않은 정보가 있습니다."
        elsif !phone.start_with?("010")
            @error = "올바른 휴대폰 번호를 입력해주세요."
        elsif !true?(agreed) || !true?(agreed2)
            @error = "필수 약관에 동의해주세요."
        else
            @user = UserTwo.where(phone: phone).first

            if !@user.nil? && @user.submitted == true
                @error = "이미 응모 완료하셨습니다."
            else
                @user = UserTwo.new
                @user.event_id = 2

                @user.phone = phone
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
