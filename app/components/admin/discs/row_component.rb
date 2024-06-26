module Admin
  module Discs
    class RowComponent < ViewComponent::Base
      with_collection_parameter :disc

      def initialize(disc:)
        @disc = disc
      end
    end
  end
end
