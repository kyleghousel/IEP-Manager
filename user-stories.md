# User Stories

## Foundation (DB, Auth, Test)
1. Initialize Rails app, tooling
As a developer, I want a clean Rails app with RSpec, FactoryBot, RuboCop so I can build confidently.
AC: rspec runs; rubocop passes baseline; factories folder present.
T: boots, one dummy spec green.

2. Define database schema via migrations
As a developer, I want tables for users, students, goals, accommodations, student_goals, progress_entries, student_accommodations, so I can persist domain data.
AC: all tables + indexes + FKs; roles enum or validated string.
T: model specs assert associations and FKs.

3. Seed minimal data
As a developer, I want seeds for 2 users, 2 students, 3 goals, 2 accommodations, a few links so I can test flows.
AC: rails db:seed completes; basic records present.
T: request spec loads dashboard without errors.

4. Basic auth flows (signup/login/logout)
As a user, I want to create an account and sign in/out so I can use the app securely.
AC: happy paths work; invalid creds show errors.
T: request specs for sessions; model spec for password validations.

5. Role guardrails (teacher/parent/admin)
As an admin, I want access to management screens; as a teacher, limited write; as a parent, read.
AC: unauthorized actions blocked; flash or 403.
T: policy specs or request specs per role.

## Core CRUD + Nesting
6. Manage Students CRUD
As a teacher, I want to create, view, update students so I can manage caseload.
AC: forms validate; list and show pages render.
T: request specs for create/update validations.

7. Catalog Goals CRUD
As an admin, I want to manage goal templates so teachers can assign them.
AC: name/objectives required; active toggle.
T: model validations and scope .active_only.

8. Assign Student Goals (nested start)
As a teacher, I want to add a goal to a student with start/target dates, baseline, target so I can track progress.
AC: /students/:id/student_goals/new works; errors show inline.
T: request spec creates student_goal; date validations.

9. Log ProgressEntry to a StudentGoal (nested)
As a teacher, I want to record a dated note, optional score, and evidence for a student goal so I can track mastery.
AC: create via /students/:sid/student_goals/:sgid/progress_entries/new; reverse-chron list.
T: model validation range for score; request spec create + list.

10. Manage Accommodations catalog + assign to student 😮‍💨
As a teacher, I want to link accommodations with start/end so I can document supports.
AC: student_accommodations add/list; date ordering.
T: end_on ≥ start_on validation.

## Reporting, Scopes, UX polish
11. Overdue and Active scopes surfaced
As a teacher, I want “Active Goals” and “Overdue Goals” lists so I can prioritize work.
AC: StudentGoal .active, .overdue shown on dashboard.
T: scope specs with date fixtures.

12. Progress timeline filters 😮‍💨
As a teacher, I want to filter entries by month and author so I can prep accordingly.
AC: filter UI; empty states.
T: scope spec .for_month and .by_author.

13. Authorization final pass
As a parent, I want read-only access; as a teacher, write only on students I own; as admin, full.
AC: blocked actions tested for each role.
T: request specs with three roles.

14. Error UX + partials 😮‍💨
As a user, I want clear inline errors and shared form partials so forms are fast and consistent.
AC: shared _errors partial used across forms.
T: feature test asserts error rendering.

## Tests, DRY, Docs, Release
15. Aggregates on StudentGoal 😮‍💨
As a teacher, I want last entry date and average score on the goal so I can see trend at a glance.
AC: derived or cached fields update on create/update/delete of entries.
T: model spec mutates entries and asserts aggregates.

16. Compliance view: “No entry in N days” 😮‍💨
As a teacher, I want a list of student goals with no entries in 14 days so I can follow up.
AC: scope + dashboard card; N configurable.
T: scope spec with dates.

17. RuboCop clean + README
As a developer, I want zero lint offenses and install docs so others can run the app.
AC: rubocop no offenses; README with setup, seeds, test, roles.
T: none beyond RuboCop run.

18. Seed expansion for demo 😮‍💨
As a reviewer, I want realistic demo data so I can evaluate quickly.
AC: 3 students, 6 goals, 12 entries, 3 accommodations.
T: seeds idempotent.

---

**Definition of Done**
- AC met, specs added, rubocop clean, role checks enforced, errors rendered, linked from nav, seeds cover feature.

**Stretch goals/nice-to-haves are time-permitting, and denoted by 😮‍💨, but would be ideal order**
