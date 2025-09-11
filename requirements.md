# Specifications for the Rails Assessment

Add notes below each checkbox with how your application has met the requirement

Requirements:
- [x] Uses Ruby on Rails
  - Note: It does.
- [x] Includes at least one has_many relationship (e.g. User has_many Recipes)
  - Note: A Student has_many StudentGoals and Student Accommodations, a Goal has_many StudentGoals, a StudentGoal has_many ProgressEntries, a User has_many ProgressEntries, and an Accommodation has many StudentAccommodations
- [x] Includes at least one belongs_to relationship (e.g. Post belongs_to User)
  - Note: A ProgressEntry belongs_to a User and belongs_to a StudentGoal, a StudentGoal belongs_to a Student and a Goal, a StudentAccommodation belongs_to a Student and an Accommodation
- [x] Includes at least two has_many through relationships (e.g. a `Recipe` could `has_many` `Item`s through `Ingredient`s)
  - Note: A Student has_many Goals through StudentGoals and has_many Accommodations through StudentAccommodations
- [x] Every model contains at least at least two simple attributes (e.g. ingredient#quantity)
  - Note: No model has less than three
- [x] Includes reasonable validations
  - Note: Validations used on most-all models
- [x] Includes a class level ActiveRecord scope method
  - Note: Scope methods utilized via Pundit Policies
- [x] Includes signup, login and logout functionality (e.g. Devise)
  - Note: App utilizes all via Devise
- [x] Includes nested resource show or index (e.g. users/2/recipes)
  - Note: student_goals and student_accommodations are nested within students, progress_entries is nested within student_goals.
- [x] Includes nested resource form (recipes/1/ingredients/new)
  - Note: The form to create a ProgressEntry hits the path `/students/:student_id/student_goals/:student_goal_id/progress_entries`
- [x] Includes form display of validation errors
  - Note: All forms utilize a shared _errors partial.
- [x] Includes Unit tests all of your models
  - Note: All models have a dedicated spec testing validations, associations, and any additional logic
- [x] Includes at least one type of Integration test (e.g. controller, request, feature, system)
  - Note: Integration request spec included for at least GoalsController
- [x] Use FactoryBot to build instances of your models in your tests
  - Note: All models have factories
- [ ] Conforms to Nitro Ruby linting rules (running `rubocop` returns 0 offenses)
  - Note: Ensure final product satisfies
- [x] Includes a `README.md` with an application description and installation guide
  - Note: README included, to be updated as stretch features added.

Confirm:
- [ ] The application is pretty DRY
  - Note: Go through controllers and ensure DRYness with before_action/helper methods
- [x] Limited logic in controllers
- [ ] Views use helper methods if appropriate
  - Note: Look for opportunities where a helper would make sense
- [x] Views use partials if appropriate
  - Note: Partials used for errors and forms where appropriate.

If you've added any additional functionality to your application that you'd like to demonstrate, please describe it below:
