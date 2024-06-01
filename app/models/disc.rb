class Disc < ApplicationRecord
  belongs_to :manufacturer
  validates :name, presence: true, uniqueness: { scope: :manufacturer_id }
  validates :slug, presence: true, uniqueness: { scope: :manufacturer_id }
  validates_presence_of :speed,
                        :glide,
                        :turn,
                        :fade,
                        :diameter,
                        :height,
                        :rim_depth,
                        :rim_width
end
