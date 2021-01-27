require 'csv'
class Item < ApplicationRecord
	belongs_to :incharge
	validates :item_name, :model_number, :installation_date, :make, :status, :warranty, presence: true

	def self.to_csv
		# attributes = %w{ name e_number m_number make lab_location date_of_installation current_status }
		CSV.generate do |csv|
			csv << column_names

			all.each do |item|
				if item.approved==true
					csv << item.attributes.values_at(*column_names)
				end
			end
		end
	end
end
