eu_vat = Spree::Zone.find_or_create_by!(name: "EU_VAT", description: "Countries that make up the EU VAT zone.")
north_america = Spree::Zone.find_or_create_by!(name: "North America", description: "USA + Canada")

["Poland", "Finland", "Portugal", "Romania", "Germany", "France",
 "Slovakia", "Hungary", "Slovenia", "Ireland", "Austria", "Spain",
 "Italy", "Belgium", "Sweden", "Latvia", "Bulgaria", "United Kingdom",
 "Lithuania", "Cyprus", "Luxembourg", "Malta", "Denmark", "Netherlands",
 "Estonia", "Croatia", "Czech Republic", "Greece"].
each do |name|
  eu_vat.zone_members.create!(zoneable: Spree::Country.find_by!(name: name))
end

["United States", "Canada"].each do |name|
  north_america.zone_members.create!(zoneable: Spree::Country.find_by!(name: name))
end


