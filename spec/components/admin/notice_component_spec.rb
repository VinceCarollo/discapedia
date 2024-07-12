# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::NoticeComponent, type: :component do
  let(:flash) do
    ActionDispatch::Flash::FlashHash.from_session_value({ flashes: }.deep_stringify_keys)
  end
  let(:flashes) { { notice: 'Hello, world!' } }

  before do
    render_inline(Admin::NoticeComponent.new(flash:))
  end

  it 'renders a notice message' do
    expect(page).to have_css('.bg-air-force-blue', text: flashes[:notice])
  end

  context 'when the flash is an error' do
    let(:flashes) { { error: 'Update Failed' } }

    it 'renders an error message' do
      expect(page).to have_css('.bg-red-500', text: flashes[:error])
    end
  end
end
