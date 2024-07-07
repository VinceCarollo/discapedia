# frozen_string_literal: true

module Discs
  class FormComponent < ViewComponent::Base
    def initialize(disc:)
      @disc = disc
    end

    private

    def submit_text
      @disc.new_record? ? 'Create' : 'Update'
    end
  end
end
