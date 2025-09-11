# IEP-Manager

This is a Rails 8 application for tracking Individualized Education Program (IEP) data. Being a Special Education Teacher means that you are given a "caseload" of students of which you are in charge of managing. Special Education teachers don't necessarily hand out grades as teachers in "typical" classrooms do, instead assigning and tracking individualized goal progress agreed upon in the IEP for each student in their caseload.

In this app, teachers can manage students, assign learning goals, record progress, and document accommodations, while parents and administrators also have role-based access to view or manage records.

⸻

## Features Implemented
- Authentication & Roles
- Sign up / log in / log out with Devise.
- Roles: Admin (full access), Teacher (limited write), Parent (read-only).
- Students CRUD – Create, edit, and view student profiles.
- Goals Catalog – Admins manage goal templates with name, objectives, category, and active toggle.
- Student Goals – Teachers assign goals to students with start/target dates, baseline, and target values.
- Progress Entries – Teachers log dated notes, optional score, and evidence for each student goal. Entries are listed newest first.
- Accommodations – Catalog of presentation/response/setting/timing supports and ability to link them to students with start/end dates.
- Authorization – All controller actions guarded with Pundit policies per role.
- Testing & Linting – RSpec model/request/policy specs, FactoryBot factories, and RuboCop enforced style.

⸻

## Getting Started

### Prerequisites
	•	Ruby 3.3+
	•	Rails 8
	•	SQLite (default dev DB)

### Setup

`git clone https://github.com/kyleghousel/IEP-Manager.git`

`cd IEP-Manager`

`bundle install`

##### creates, migrates, seeds`
`bin/rails db:setup`

The seed file creates:
	•	Users: one admin, one teacher, one parent
	•	Students: 4 sample students
	•	Goals: 5 sample goals
	•	Accommodations: 3 sample accommodations
	•	Links between them for quick demo with progress entries.

For quick reference, the seed admin user's login info is:
	email: admin@example.com
	password: adminpassword

### Run the server:

`bin/rails s`

Visit http://localhost:3000 and log in with seeded credentials (see db/seeds.rb for additional login info), or follow Sign Up flow.

⸻

### Running Tests & Lint

##### run model, request, and policy specs
`bundle exec rspec`

##### style & lint
`bundle exec rubocop`

Factories are defined under spec/factories and cover all models.

⸻

### Roles & Access

Role	Permissions
Admin	Full CRUD on all resources.
Teacher	Manage students, assign goals, log progress, add accommodations.
Parent	Read-only access to their child’s data (no create/update).


⸻

### Tech Stack

	•	Ruby on Rails 8
	•	Devise (authentication)
	•	Pundit (authorization)
	•	RSpec & Shoulda-Matchers (testing)
	•	FactoryBot (test data)
	•	RuboCop (linting)

⸻

This README captures the current MVP: database schema, authentication, role guardrails, and all core CRUD flows for students, goals, progress entries, and accommodations. Stretch goals from user-stories.md (reporting dashboards, filters, aggregates, etc.) are intentionally omitted until implemented.
