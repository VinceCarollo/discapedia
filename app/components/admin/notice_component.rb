module Admin
  class NoticeComponent < ViewComponent::Base
    NOTIFICATION_DELAY = '2000'.freeze
    def initialize(flash:)
      @flash = flash
    end

    erb_template <<~ERB
      <% @flash.each do |type, msg| %>
        <div
          class="<%= notification_classes(type) %>"
          <%= tag.attributes(**notification_data_attributes) %>>
          <p><%= msg %></p>
        </div>
      <% end %>
    ERB

    private

    def notification_data_attributes
      { 'data-controller': 'notification',
        'data-notification-delay-value': notification_delay_value,
        'data-transition-enter-from': 'opacity-0 translate-x-6',
        'data-transition-enter-to': 'opacity-100 translate-x-0',
        'data-transition-leave-from': 'opacity-100 translate-x-0',
        'data-transition-leave-to': 'opacity-0 translate-x-6' }
    end

    def notification_delay_value
      NOTIFICATION_DELAY
    end

    def notification_classes(type)
      %w[absolute transition transform duration-1000 py-3 px-12 text-black
         rounded-lg text-center right-20 top-10 text-xl].tap do |classes|
        classes << background_color_class(type)
      end.join(' ')
    end

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
