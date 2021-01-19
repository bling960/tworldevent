class UserOne < ApplicationRecord
    belongs_to :event

    require "csv"

    
    def self.to_csv
        bom = %w(EF BB BF).map { |e| e.hex.chr }.join
        CSV.generate(bom) do |csv|
            csv << column_names
            all.each do |result|
                csv << result.attributes.values_at(*column_names)
            end
        end
    end

    def initialize_code
        self.code = ""
    end
    handle_asynchronously :initialize_code, :run_at => Proc.new { 3.minutes.from_now }
end
