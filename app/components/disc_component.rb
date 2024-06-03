# frozen_string_literal: true

class DiscComponent < ViewComponent::Base
  def initialize(manufacturer:, discs:)
    @manufacturer = manufacturer
    @discs = discs
  end
end
