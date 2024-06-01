require 'rails_helper'

RSpec.describe Disc, type: :model do
  before do
    manufacturer = Manufacturer.create!(name: 'Innova', slug: 'innova')
    Disc.create!(name: 'Destroyer',
                 slug: 'destroyer',
                 speed: 12,
                 glide: 5,
                 turn: -1,
                 fade: 3,
                 diameter: 21.1,
                 height: 1.4,
                 rim_depth: 1.2,
                 rim_width: 2.2,
                 manufacturer:)
  end
  it { should belong_to(:manufacturer) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:manufacturer_id) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug).scoped_to(:manufacturer_id) }
  it { should validate_presence_of(:speed) }
  it { should validate_presence_of(:glide) }
  it { should validate_presence_of(:turn) }
  it { should validate_presence_of(:fade) }
  it { should validate_presence_of(:diameter) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:rim_depth) }
  it { should validate_presence_of(:rim_width) }
end
