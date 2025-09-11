puts "Seeding users..."
admin = User.find_or_initialize_by(email: "admin@example.com")
admin.assign_attributes(first_name: "Ada", last_name: "Admin", role: "admin",
                        password: "changeme!", password_confirmation: "changeme!")
admin.save!

teacher = User.find_or_initialize_by(email: "teacher@example.com")
teacher.assign_attributes(first_name: "Tess", last_name: "Teacher", role: "teacher",
                          password: "changeme!", password_confirmation: "changeme!")
teacher.save!

puts "Seeding accommodations..."
a_pres = Accommodation.find_or_create_by!(name: "Chunked Text") do |a|
  a.accommodation_type = :presentation
  a.details = "Shorter passages, bolded keywords."
end

a_set = Accommodation.find_or_create_by!(name: "Preferential Seat") do |a|
  a.accommodation_type = :setting
  a.details = "Front-left, minimal distractions."
end

puts "Seeding students..."
s1 = Student.find_or_create_by!(first_name: "Milo", last_name: "Rivera") do |s|
  s.dob = Date.new(2014, 6, 3)
  s.diagnosis = "ADHD"
  s.grade_level = "5"
end
s2 = Student.find_or_create_by!(first_name: "Ava", last_name: "Chen") do |s|
  s.dob = Date.new(2015, 11, 22)
  s.diagnosis = "Dyslexia"
  s.grade_level = "4"
end

puts "Seeding goals..."
g_read = Goal.find_or_create_by!(name: "Reading Fluency") do |g|
  g.objectives = "Read 120 wpm with ≤3 errors."
  g.category = "ELA"
  g.active = true
end
g_math = Goal.find_or_create_by!(name: "Math Facts") do |g|
  g.objectives = "Solve 20 mixed facts in 2 min."
  g.category = "Math"
  g.active = true
end
g_write = Goal.find_or_create_by!(name: "Written Expression") do |g|
  g.objectives = "Write 3-paragraph essay with rubric ≥3."
  g.category = "ELA"
  g.active = true
end

puts "Seeding goals and assigning to students..."
sg1 = StudentGoal.find_or_create_by!(student: s1, goal: g_read) do |sg|
  sg.start_on = Date.today - 30
  sg.target_date = Date.today + 90
  sg.baseline = "85 wpm"
  sg.target_value = "120 wpm"
  sg.status = "in_progress"
  sg.mastery_percent = 45
end

sg2 = StudentGoal.find_or_create_by!(student: s1, goal: g_math) do |sg|
  sg.start_on = Date.today - 14
  sg.target_date = Date.today + 60
  sg.baseline = "10/20"
  sg.target_value = "20/20"
  sg.status = "planned"
  sg.mastery_percent = 0
end

sg3 = StudentGoal.find_or_create_by!(student: s2, goal: g_write) do |sg|
  sg.start_on = Date.today - 21
  sg.target_date = Date.today + 75
  sg.baseline = "Rubric 1"
  sg.target_value = "Rubric 3"
  sg.status = "in_progress"
  sg.mastery_percent = 30
end

puts "Seeding Progress entries..."
ProgressEntry.find_or_create_by!(student_goal: sg1, user: teacher, recorded_on: Date.today - 7) do |pe|
  pe.note = "Cold read passage A. 95 wpm, 5 errors."
  pe.score_numeric = 79
  pe.evidence_url = "https://example.com/evidence/reading-a"
end
ProgressEntry.find_or_create_by!(student_goal: sg1, user: teacher, recorded_on: Date.today - 1) do |pe|
  pe.note = "Cold read passage B. 102 wpm, 3 errors."
  pe.score_numeric = 85
end
ProgressEntry.find_or_create_by!(student_goal: sg3, user: teacher, recorded_on: Date.today - 3) do |pe|
  pe.note = "Organizer used
 2 paragraphs with topic sentences."
  pe.score_numeric = 70
end

puts "Seeding Student accommodations..."
StudentAccommodation.find_or_create_by!(student: s1, accommodation: a_pres) do |sa|
  sa.start_on = Date.today - 10
  sa.notes = "Use for all ELA passages."
end
StudentAccommodation.find_or_create_by!(student: s2, accommodation: a_set) do |sa|
  sa.start_on = Date.today - 5
  sa.notes = "Seat near teacher for small-group."
end
