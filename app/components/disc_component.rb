class DiscComponent < ViewComponent::Base
  def initialize(disc:)
    @disc = disc
  end

  def speed
    number_to_human(@disc.speed)
  end

  def glide
    number_to_human(@disc.glide)
  end

  def turn
    number_to_human(@disc.turn)
  end

  def fade
    number_to_human(@disc.fade)
  end
end
