class Crew < ActiveRecord::Base

	validates :name, presence: true
	validates :title, :origin, :age, :avatar, :species, presence: true,
						unless: Proc.new { |a| a.new_record?}

end


