# IEP-Manager

A Rails 8 application for tracking Individualized Education Program (IEP) data.
Teachers can manage students, assign learning goals, record progress, and document accommodations, while parents and administrators have role-based access to view or manage records.

⸻

## Features Implemented
	•	Authentication & Roles – Sign up / log in / log out with Devise.
Roles: Admin (full access), Teacher (limited write), Parent (read-only).
	•	Students CRUD – Create, edit, and view student profiles.
	•	Goals Catalog – Admins manage goal templates with name, objectives, category, and active toggle.
	•	Student Goals – Teachers assign goals to students with start/target dates, baseline, and target values.
	•	Progress Entries – Teachers log dated notes, optional score, and evidence for each student goal. Entries are listed newest first.
	•	Accommodations – Catalog of presentation/response/setting/timing supports and ability to link them to students with start/end dates.
	•	Authorization – All controller actions guarded with Pundit policies per role.
	•	Testing & Linting – RSpec model/request/policy specs, FactoryBot factories, and RuboCop enforced style.

⸻

## Getting Started

### Prerequisites
	•	Ruby 3.3+
	•	Rails 8
	•	SQLite (default dev DB)

### Setup

git clone https://github.com/<your-username>/IEP-Manager.git
cd IEP-Manager
bundle install
bin/rails db:setup   # creates, migrates, seeds

The seed file creates:
	•	Users: one admin, one teacher
	•	Students: 2 sample students
	•	Goals: 3 sample goals
	•	Accommodations: 2 sample accommodations
	•	Links between them for quick demo.

### Run the server:

bin/rails s

Visit http://localhost:3000 and log in with seeded credentials (see db/seeds.rb).

⸻

### Running Tests & Lint

bundle exec rspec   # run model, request, and policy specs
bundle exec rubocop # style & lint

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
