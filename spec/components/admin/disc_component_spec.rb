# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::DiscComponent, type: :component do
  let(:component) {  described_class.new(disc:) }
  let(:manufacturer) { Manufacturer.create!(name: 'Innova', slug: 'innova') }
  let(:disc) { Disc.create!(disc_attributes) }

  let(:disc_attributes) do
    { name: 'Destroyer',
      slug: 'destroyer',
      manufacturer_id: manufacturer.id,
      speed: 12,
      glide: 5,
      turn: -1,
      fade: 3,
      diameter: 21.1,
      height: 1.4,
      rim_depth: 1.2,
      rim_width: 2.2 }
  end

  before do
    render_inline(component)
  end

  it 'renders id' do
    expect(page).to have_content(disc.id)
  end

  it 'renders name' do
    expect(page).to have_content(disc_attributes[:name])
  end

  it 'renders slug' do
    expect(page).to have_content(disc_attributes[:slug])
  end

  it 'renders speed' do
    expect(page).to have_content(disc_attributes[:speed])
  end

  it 'renders glide' do
    expect(page).to have_content(disc_attributes[:glide])
  end

  it 'renders turn' do
    expect(page).to have_content(disc_attributes[:turn])
  end

  it 'renders fade' do
    expect(page).to have_content(disc_attributes[:fade])
  end

  it 'renders diameter' do
    expect(page).to have_content(disc_attributes[:diameter])
  end

  it 'renders height' do
    expect(page).to have_content(disc_attributes[:height])
  end

  it 'renders rim depth' do
    expect(page).to have_content(disc_attributes[:rim_depth])
  end

  it 'renders rim width' do
    expect(page).to have_content(disc_attributes[:rim_width])
  end

  it 'renders edit button' do
    expect(page).to have_selector(:link_or_button, 'Edit')
  end
end
