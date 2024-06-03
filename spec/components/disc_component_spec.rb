# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiscComponent, type: :component do
  let(:manufacturer) { Manufacturer.new(name: 'Innova') }
  let(:disc) { Disc.new(disc_attributes) }
  let(:disc_attributes) do
    { name: 'Destroyer',
      manufacturer_id: manufacturer.id,
      speed: 12,
      glide: 5,
      turn: -1,
      fade: 3 }
  end

  before do
    render_inline(described_class.new(manufacturer:, discs: [disc]))
  end

  it 'renders disc attribute preview in dropdown' do
    disc_attributes.each_value do |value|
      expect(page).to have_content(value.to_s)
    end
  end
end
