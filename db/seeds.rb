# Esborra dades prèvies
ItemPartAttributeOption.delete_all
ItemPartAttribute.delete_all
ItemPart.delete_all
Item.delete_all

# ITEM
bike = Item.create!(name: "Configurable Bike", description: "Build your own custom bicycle")

# === FRAME PART ===
frame = bike.item_parts.create!(name: "Frame", description: "The core structure of the bike")

frame_type_attr = frame.item_part_attributes.create!(name: "Type")
frame_type_attr.item_part_attribute_options.create!([
  { name: "Full-suspension", price: 300, stock: 10 },
  { name: "Diamond", price: 250, stock: 15 },
  { name: "Step-through", price: 200, stock: 20 }
])

frame_finish_attr = frame.item_part_attributes.create!(name: "Finish")
frame_finish_attr.item_part_attribute_options.create!([
  { name: "Matte", price: 30, stock: 50 },
  { name: "Shiny", price: 40, stock: 50 }
])

# === WHEELS PART ===
wheels = bike.item_parts.create!(name: "Wheels", description: "Choose your wheel type")

wheels_type_attr = wheels.item_part_attributes.create!(name: "Type")
wheels_type_attr.item_part_attribute_options.create!([
  { name: "Road wheels", price: 100, stock: 20 },
  { name: "Mountain wheels", price: 150, stock: 15 },
  { name: "Fat bike wheels", price: 180, stock: 10 }
])

# === RIMS SUBPART OF WHEELS ===
rims = bike.item_parts.create!(name: "Rims", description: "Choose your rim color", parent: wheels)

rim_color_attr = rims.item_part_attributes.create!(name: "Color")
rim_color_attr.item_part_attribute_options.create!([
  { name: "Red", price: 15, stock: 10 },
  { name: "Black", price: 10, stock: 25 },
  { name: "Blue", price: 12, stock: 20 }
])

# === CHAIN PART ===
chain = bike.item_parts.create!(name: "Chain", description: "Select chain type")

chain_type_attr = chain.item_part_attributes.create!(name: "Type")
chain_type_attr.item_part_attribute_options.create!([
  { name: "Single-speed chain", price: 25, stock: 30 },
  { name: "8-speed chain", price: 35, stock: 25 }
])

puts "✅ Seed completat correctament!"
puts "Total d'articles: #{Item.count}"
