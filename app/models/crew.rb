class Crew < ActiveRecord::Base

	validates :name, presence: true
	validates :title, :origin, :species, presence: true, unless: Proc.new { |m| m.new_record? }
  validates :age, numericality: true, presence: true, unless: Proc.new { |m| m.new_record? }

end


