require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  before do
    Manufacturer.create!(name: 'Innova', slug: 'innova')
  end

  it { should have_many(:discs) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug) }
end
