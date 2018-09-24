# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Rates
Rate.create(code: 110, category: "MOTOS", sub_category: "MOTOS", unit_of_measurement: "C.C", minimum_unit: "0", maximum_unit: "100", bonus: 203100)
Rate.create(code: 212, category: "CAMPEROS Y CAMIONETAS", sub_category: "CAMPEROS Y CAMIONETAS", unit_of_measurement: "C.C", minimum_unit: "0", maximum_unit: "1500", minimum_age: 0, maximum_age: 10, bonus: 326800)
Rate.create(code: 310, category: "CARGA O MIXTO", sub_category: "CARGA O MIXTO", unit_of_measurement: "Toneladas", minimum_unit: "0", maximum_unit: "5", bonus: 366300)

# Create User 
User.create(name: 'Camilo', last_name: 'Lopez', email: 'camilo@example.com', document_type: "Cedula", document: "1018", phone: "300725", password: "secret123", password_confirmation: "secret123")

# Create Vehicle
year = Date.current - 3.years; Vehicle.create(license: "qwe123", category: "CAMPEROS Y CAMIONETAS", sub_category: "CAMPEROS Y CAMIONETAS", unit_of_measurement: "C.C", unit_value: 1400, year: year, user_id: 1)


