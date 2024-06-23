require 'rails_helper'

RSpec.describe Disc, type: :model do
  let!(:disc) { create(:disc) }

  it { should belong_to(:manufacturer) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:manufacturer_id) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug).scoped_to(:manufacturer_id) }
  it { should validate_presence_of(:speed) }
  it { should validate_presence_of(:glide) }
  it { should validate_presence_of(:turn) }
  it { should validate_presence_of(:fade) }
end
