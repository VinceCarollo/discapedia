# frozen_string_literal: true

module Discs
  class FormComponent < ViewComponent::Base
    def initialize(disc:)
      @disc = disc
    end
  end
end
