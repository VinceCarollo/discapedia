# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discs::FormComponent, type: :component do
  let(:component) { described_class.new(disc:) }
  let(:disc) { create(:disc) }

  before do
    render_inline(component)
  end

  it 'renders a form' do
    expect(page).to have_selector('form')
  end

  it 'renders a text field for the disc name' do
    expect(page).to have_selector("input[name='disc[name]'][type='text']")
  end

  it 'renders a number field for the disc slug' do
    expect(page).to have_selector("input[name='disc[slug]'][type='text']")
  end

  it 'renders a number field for the disc flight_chart_url' do
    expect(page).to have_selector("input[name='disc[flight_chart_url]'][type='text']")
  end

  it 'renders a number field for the disc speed' do
    expect(page).to have_selector("input[name='disc[speed]'][type='number']")
  end

  it 'renders a number field for the disc glide' do
    expect(page).to have_selector("input[name='disc[glide]'][type='number']")
  end

  it 'renders a number field for the disc turn' do
    expect(page).to have_selector("input[name='disc[turn]'][type='number']")
  end

  it 'renders a number field for the disc fade' do
    expect(page).to have_selector("input[name='disc[fade]'][type='number']")
  end

  it 'renders a select field for the disc category' do
    expect(page).to have_selector("select[name='disc[category]']")
  end

  it 'renders a select field for the disc stability' do
    expect(page).to have_selector("select[name='disc[stability]']")
  end
end
