namespace :db do
  task populate_from_csv: :environment do
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
end

private

def update_manufacturer_name(manufacturer)
  name = manufacturer.slug.gsub('-', ' ').titleize
  manufacturer.update!(name:)
end
