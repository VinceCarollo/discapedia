module Admin
  class DiscComponent < ViewComponent::Base
    def initialize(disc:)
      @disc = disc
    end
  end
end
