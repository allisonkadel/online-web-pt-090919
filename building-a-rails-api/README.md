# how do we change our MVC app to just an API?
* Make ApplicationController inherit from ActionController::API instead of ActionController::Base. As with middleware, this will leave out any Action Controller
* get rid of views directory
* change controllers to respond with json instead of views/html