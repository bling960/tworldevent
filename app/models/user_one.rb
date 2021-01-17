class UserOne < ApplicationRecord
    belongs_to :event

    def initialize_code
        self.code = ""
    end
    handle_asynchronously :initialize_code, :run_at => Proc.new { 3.minutes.from_now }
end
