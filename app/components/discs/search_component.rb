module Discs
  class SearchComponent < ViewComponent::Base
    AUTO_SUBMIT_DELAY = 200

    private_constant :AUTO_SUBMIT_DELAY

    private

    def auto_submit_delay_value
      200
    end

    def input_data_actions
      %w[input->reveal#show
         input->auto-submit#submit
         input->disc-search#hideResultsOnClear
         focus->disc-search#showResultsIfPresent].join(' ')
    end
  end
end
