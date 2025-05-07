# Esborra dades anteriors
IncompatibilityRule.destroy_all
PartAttribute.destroy_all
ItemPart.destroy_all
Item.destroy_all

# Crea un producte
bike = Item.create!(name: "Bicicleta", description: "Personalitza la teva bicicleta!")

# Crea parts
frame = bike.item_parts.create!(name: "Frame")
frame_finish = bike.item_parts.create!(name: "Frame Finish", parent: frame)
wheels = bike.item_parts.create!(name: "Wheels")
rim_color = bike.item_parts.create!(name: "Rim Color", parent: wheels)
chain = bike.item_parts.create!(name: "Chain")


# Afegeix atributs
full_suspension = frame.part_attributes.create!(name: "Full Suspension", price: 130)
diamond = frame.part_attributes.create!(name: "Diamond", price: 950)
step_through = frame.part_attributes.create!(name: "Step Through", price: 112)


mountain_wheels = wheels.part_attributes.create!(name: "Mountain Wheels", price: 70)
road_wheels = wheels.part_attributes.create!(name: "Road Wheels", price: 66.50)
fat_bike_wheels = wheels.part_attributes.create!(name: "Fat Bike Wheels", price: 90)

ss_chain = chain.part_attributes.create!(name: "Single-Speed Chain", price: 35)
s8_chain = chain.part_attributes.create!(name: "8-Speed Chain", price: 48)

shiny_frame_finish = frame_finish.part_attributes.create!(name: "Shiny Frame Finish", price: 20)
matte_frame_finish = frame_finish.part_attributes.create!(name: "Matte Frame Finish", price: 25)
rim_color_red = rim_color.part_attributes.create!(name: "Red Rim Color", price: 10)
rim_color_blue = rim_color.part_attributes.create!(name: "Blue Rim Color", price: 12)


# Regla d'incompatibilitat: "Mountain Wheels" només amb "Full Suspension"
IncompatibilityRule.create!(
  attribute_a: mountain_wheels,
  attribute_b: diamond # No pots combinar-los
)

IncompatibilityRule.create!(
  attribute_a: fat_bike_wheels,
  attribute_b: rim_color_red
)
