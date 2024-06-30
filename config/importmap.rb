# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@stimulus-components/auto-submit", to: "@stimulus-components--auto-submit.js" # @6.0.0
pin "@stimulus-components/reveal", to: "@stimulus-components--reveal.js" # @5.0.0
pin_all_from "app/javascript/controllers", under: "controllers"

