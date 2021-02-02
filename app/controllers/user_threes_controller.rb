class UserThreesController < ApplicationController
    def export_csv
        respond_to do |format|
           format.csv { send_data UserThree.to_csv }
        end
    end

    def destroy_all
        UserThree.destroy_all
        redirect_to "/admin/user_threes"
    end

    def submit_user_three
        name = params[:user_three][:name]
        phone = params[:user_three][:phone]
        prize = params[:user_three][:prize]
        shop = params[:user_three][:shop]
        agreed = params[:user_three][:agreed]
        agreed2 = params[:user_three][:agreed2]

        if prize.blank?
            @error = "경품을 선택해주세요"
        elsif name.blank? || shop.blank? || agreed.blank? || agreed2.blank? || phone.blank?
            @error = "입력되지 않은 정보가 있습니다."
        elsif !phone.start_with?("010")
            @error = "올바른 휴대폰 번호를 입력해주세요."
        elsif !true?(agreed) || !true?(agreed2)
            @error = "필수 약관에 동의해주세요."
        else
            @user = UserThree.where(phone: phone).first

            if !@user.nil? && @user.submitted == true
                @error = "이미 응모 완료하셨습니다."
            else
                @user = UserThree.new
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
                format.js { render inline: "document.getElementById('finished').classList.remove('d-none')" }
            else
                format.js { render inline: "alert('" + @error + "')" }
            end
        end

    end

    def true?(obj)
        obj.to_s.downcase == "true" || obj.to_s.downcase == "1"
    end


end
