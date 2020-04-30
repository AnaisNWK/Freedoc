class Specialty < ApplicationRecord
	has_many :doctors, through: :specialty_doctor_joins
end
