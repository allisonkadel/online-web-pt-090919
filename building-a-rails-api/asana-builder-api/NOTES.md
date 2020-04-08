Requirements

Your models must:

• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

Your application must provide standard user authentication, including signup, login, logout, and passwords.

Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

You must include and make use of a nested resource with the appropriate RESTful URLs.

• You must include a nested new route with form that relates to the parent resource

• You must include a nested index or show route

Your forms should correctly display validation errors.

a. Your fields should be enclosed within a fields_with_errors class

b. Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in your controllers should be encapsulated as methods in your models.

• Your views should use helper methods and partials when appropriate.

• Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.

# Feature requests
* scope method: filter Asanas by category and/or spinal effect
* model method: return duration of Sequence based on sum of duration of associated Postures
* view helper method: converts duration format from seconds to minutes & seconds
* helper method: converts duration format from seconds to breaths

# Todo

## asanas

### db
* name, english, sanskrit, effect_on_spine, category, img, suitable_for_meditation

### controller
* index

### model

### routes
* get '/asanas', to: 'asanas#index'

### views
* index

## Sequences

### controller
* index
* new
* create

### routes
* get '/sequences', to 'sequences#index'
* get '/sequences/new', to: 'sequences#new'
* post '/sequences', to: 'sequences#create'

### helpers
* instance method to calculate total duration across postures
* view method to display duration in minutes and seconds

### views
* index
* new

## Postures

### controller
* new
* index
* create

### routes
* get '/sequences/:sequence_id/postures', to: 'postures#index'
* get '/sequences/:sequence_id/postures/new', to: 'postures#new'
* post '/postures', to: 'postures#create'

### views
* new => nested under sequences
* index => nested under sequences

## authentication - adding a User model

### controllers
* SessionsController to handle login and logout
* UsersController to handle signup (creating a user account)

### views
* signup form
* login form

### routes
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'

### relationships
user has_many sequences
user has_many postures through sequences
sequence belongs_to user
posture belongs_to user through sequences