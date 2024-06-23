namespace :db do
  task populate_from_json: :environment do
    JSON.parse(File.read(Rails.root.join('db', 'backups', 'disc.json'))).each do |row|
      manufacturer = Manufacturer.find_or_initialize_by(slug: row['Manufacturer'].downcase)
      update_manufacturer_name(manufacturer) if manufacturer.new_record?
      disc = Disc.find_or_initialize_by(manufacturer:, slug: row['Name'].downcase.gsub(' ', '-'))
      next if disc.persisted?

      disc.update!(name: row['Name'].titleize,
                   speed: row['Speed'],
                   glide: row['Glide'],
                   turn: row['Turn'],
                   fade: row['Fade'],
                   diameter: row['Diameter'],
                   height: row['Height'],
                   rim_depth: row['RimDepth'],
                   rim_width: row['RimWidth'])
    end
  end

  task import_new_data_from_json: :environment do
    JSON.parse(File.read(Rails.root.join('db', 'backups', 'disc2.json'))).each do |row|
      manufacturer = Manufacturer.find_by(slug: row['brand_slug']) ||
                     Manufacturer.find_by(slug: row['brand_slug'].gsub('-discs', '')) ||
                     Manufacturer.find_by(slug: "#{row['brand_slug']}-discs")
      next if manufacturer.blank?

      disc = find_disc_with_morphed_slug(slug: row['name_slug'], manufacturer:)
      disc ||= Disc.find_by(slug: row['name_slug'], manufacturer:)
      next if disc.blank?

      disc.update!(category: row['category_slug'].gsub('-', '_'),
                   stability: row['stability_slug'].gsub('-', '_'),
                   flight_chart_url: row['pic'],
                   speed: row['speed'].to_f,
                   glide: row['glide'].to_f,
                   turn: row['turn'].to_f,
                   fade: row['fade'].to_f)

    end
  end
end

private

def find_disc_with_morphed_slug(slug:, manufacturer:)
  return unless slug.include?('-new') || slug.include?('-retooled')

  Disc.find_by(slug: slug.gsub('-new', '').gsub('-retooled', ''), manufacturer:)
end

def update_manufacturer_name(manufacturer)
  name = manufacturer.slug.gsub('-', ' ').titleize
  manufacturer.update!(name:)
end
