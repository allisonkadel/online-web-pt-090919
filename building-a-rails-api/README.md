# how do we change our MVC app to just an API?
* Make ApplicationController inherit from ActionController::API instead of ActionController::Base. As with middleware, this will leave out any Action Controller
* get rid of views directory
* change controllers to respond with json instead of views/html

# Bumps in the road:
* When we change our controllers to inherit from ActionController::API, we will lose the ability to call the `respond_to` method in the controllers (see commented out controller code). Instead we can make use of the `render` method
* When we make a fetch request from a place (an origin) other than the place we are requesting the data from (this will be the case when we have separate frontend and backend), we will be blocked by the browser's CORS policy that prohibits cross origin resource sharing. We can override this setting in