class Disc < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name,
                  associated_against: { manufacturer: :name },
                  against: :name,
                  using: { tsearch: { prefix: true } }

  has_one_attached :image

  belongs_to :manufacturer

  validates :buy_url,
            format: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
            allow_blank: true
  validates :name, presence: true, uniqueness: { scope: :manufacturer_id }
  validates :slug, presence: true, uniqueness: { scope: :manufacturer_id }
  validates_presence_of :speed,
                        :glide,
                        :turn,
                        :fade

  enum category: %i[distance_driver control_driver hybrid_driver fairway_driver midrange approach putter]
  enum stability: %i[very_overstable overstable stable understable very_understable]

  def image_file_name
    image.blob.filename.to_s if image.attached?
  end
end
