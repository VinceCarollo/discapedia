namespace :db do
  task import_new_data_from_json: :environment do
    JSON.parse(File.read(Rails.root.join('db', 'backups', 'disc2.json'))).each do |row|
      manufacturer = Manufacturer.find_by(slug: row['brand_slug']) ||
                     Manufacturer.find_by(slug: row['brand_slug'].gsub('-discs', '')) ||
                     Manufacturer.find_by(slug: "#{row['brand_slug']}-discs")
      next if manufacturer.blank?

      slug = row['name_slug'].gsub('-new', '').gsub('-retooled', '')
      disc = Disc.find_by(slug:, manufacturer:)
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

  task create_discs_from_new_json: :environment do
    JSON.parse(File.read(Rails.root.join('db', 'backups', 'disc2.json'))).each do |row|
      manufacturer = Manufacturer.find_by(slug: row['brand_slug']) ||
                     Manufacturer.find_by(slug: row['brand_slug'].gsub('-discs', '')) ||
                     Manufacturer.find_by(slug: "#{row['brand_slug']}-discs")

      if manufacturer.blank?
        manufacturer = Manufacturer.create!(slug: row['brand_slug'],
                                            name: row['brand_slug'].gsub('-', ' ').titleize)
      end

      slug = row['name_slug'].gsub('-new', '').gsub('-retooled', '')
      disc = Disc.find_by(slug:, manufacturer:)
      disc ||= Disc.find_by(slug: slug.gsub('-', ''), manufacturer: manufacturer)
      next if disc.present? || row['category_slug'] == 'disc-golf-sets'

      Disc.create!(manufacturer: manufacturer,
                   name: slug.gsub('-', ' ').titleize,
                   slug:,
                   category: row['category_slug'].gsub('-', '_'),
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

def update_manufacturer_name(manufacturer)
  name = manufacturer.slug.gsub('-', ' ').titleize
  manufacturer.update!(name:)
end
