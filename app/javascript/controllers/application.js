import { Application } from "@hotwired/stimulus"

import AutoSubmit from '@stimulus-components/auto-submit'
import RevealController from '@stimulus-components/reveal'
import Notification from '@stimulus-components/notification'

const application = Application.start()

application.register('auto-submit', AutoSubmit)
application.register('reveal', RevealController)
application.register('notification', Notification)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
