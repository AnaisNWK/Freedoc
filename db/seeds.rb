# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


City.destroy_all
50.times do |i|
	city = City.create!(
	name: Faker::Address.city
	)
puts  "Cities created"
end

Doctor.destroy_all
23.times do |i|
	doctor = Doctor.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		# specialty: ["Dermatologue", "Généraliste", "Gynecologue", "Ophtalmologue", "ORL"].sample,
		zip_code: Faker::Number.within(range: 01000..95999),
		city: City.all.sample
	)
puts  "Doctors created"

end

Patient.destroy_all
98.times do |i|
	patient = Patient.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		city: City.all.sample
	)
puts  "Patients created"
end

Appointment.destroy_all
60.times do |i|
	appointment = Appointment.create!(
		date: Faker::Date.between(from: 30.days.ago, to: 1.year.from_now),
		doctor: Doctor.all.sample,
		patient: Patient.all.sample,
		city: City.all.sample
	)
puts  "Appointments created"
end 

Specialty.destroy_all
12.times do |i|
	specialty = Specialty.create!(
		name: ["Dermatologue", "Généraliste", "Gynecologue", "Ophtalmologue", "ORL"].sample
		)
puts "Specialities created"
end

SpecialtyDoctorJoin.destroy_all
23.times do |i|
	specialty_doctor_join = SpecialtyDoctorJoin.create!(
			doctor: Doctor.all.sample,
			specialty: Specialty.all.sample
		)
puts "SpecialtyDoctorJoins created"
end