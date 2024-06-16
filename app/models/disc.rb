class Disc < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true } }

  has_one_attached :image

  belongs_to :manufacturer
  validates :buy_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
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

  def image_file_name
    image.blob.filename.to_s if image.attached?
  end
end
