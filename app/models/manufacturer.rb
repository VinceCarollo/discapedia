class Manufacturer < ApplicationRecord
  has_many :discs
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
