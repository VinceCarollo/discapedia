class SearchService
  include ActiveModel::Validations

  validates :query, presence: true
  validates :sort_by, inclusion: { in: %w[name speed glide turn fade] }
  validates :sort_direction, inclusion: { in: %w[asc desc] }

  attr_reader :query, :sort_by, :sort_direction

  def self.call(query:, sort_by:, sort_direction:)
    search = new(query, sort_by, sort_direction)
    return search.call if search.valid?

    raise ArgumentError, search.errors.full_messages.join(', ')
  end

  def initialize(query, sort_by, sort_direction)
    @query = query
    @sort_by = sort_by || 'name'
    @sort_direction = sort_direction || 'asc'
  end

  def call
    Disc.search_by_name(query)
        .reorder(Arel.sql("discs.#{sort_by} #{sort_direction}"))
        .includes(:manufacturer)
        .group_by(&:manufacturer)
  end
end
