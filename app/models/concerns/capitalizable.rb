module Capitalizable
  extend ActiveSupport::Concern

  included do
    before_save :capitilize_name
  end

  private

  def capitilize_name
    self.name = name.titleize
  end
end
