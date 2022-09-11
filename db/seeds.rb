# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Frame.create(name: "Frame1", status: "active", stock: 10, price: 150.00)
Frame.create(name: "Frame2", status: "active", stock: 10, price: 160.00)
Frame.create(name: "Frame3", status: "inactive", stock: 10, price: 170.00)
Frame.create(name: "Frame4", status: "active", stock: 10, price: 180.00)
Frame.create(name: "Frame5", status: "active", stock: 10, price: 190.00)
Frame.create(name: "Frame6", status: "inactive", stock: 10, price: 200.00)

Currency.create(name: "USD", dollar_conversion_rate: 1)
Currency.create(name: "GBP", dollar_conversion_rate: 1.16)
Currency.create(name: "EUR", dollar_conversion_rate: 0.99)
Currency.create(name: "JOD", dollar_conversion_rate: 1.41)
Currency.create(name: "JPY", dollar_conversion_rate: 0.007)

Len.create(color: "green", prescription_type: "varifocals", lens_type: "transition", stock: 10, price: 150.00)
Len.create(color: "pink", prescription_type: "single_vision", lens_type: "blue_light", stock: 10, price: 250.00)
Len.create(color: "blue", prescription_type: "fashion", lens_type: "classic", stock: 10, price: 350.00)

User.create(name: "Kumar", country: "JPN", currency: "JPY")
User.create(name: "Shashank", country: "ENG", currency: "GBP")

Glass.create(frame_id: 1, len_id: 1, user_id: 1)
