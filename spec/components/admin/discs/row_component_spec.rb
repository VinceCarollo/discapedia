# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Discs::RowComponent, type: :component do
  let(:component) {  described_class.new(disc:) }
  let(:manufacturer) { create(:manufacturer) }
  let(:disc) { create(:disc, manufacturer:) }

  before do
    render_inline(component)
  end

  it 'renders id' do
    expect(page).to have_content(disc.id)
  end

  it 'renders name' do
    expect(page).to have_content(disc.name)
  end

  it 'renders slug' do
    expect(page).to have_content(disc.slug)
  end

  it 'renders speed' do
    expect(page).to have_content(disc.speed)
  end

  it 'renders glide' do
    expect(page).to have_content(disc.glide)
  end

  it 'renders turn' do
    expect(page).to have_content(disc.turn)
  end

  it 'renders fade' do
    expect(page).to have_content(disc.fade)
  end

  it 'renders edit button' do
    expect(page).to have_selector(:link_or_button, 'Edit')
  end
end
