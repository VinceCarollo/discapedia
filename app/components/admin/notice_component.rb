module Admin
  class NoticeComponent < ViewComponent::Base
    def initialize(flash:)
      @flash = flash
    end

    private

    def background_color_class(type)
      case type
      when 'error'
        'bg-red-500'
      else
        'bg-air-force-blue'
      end
    end
  end
end
