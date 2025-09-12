puts "Seeding users..."
admin = User.find_or_initialize_by(email: "admin@example.com")
admin.assign_attributes(first_name: "Ada", last_name: "Admin", role: "admin",
                        password: "adminpassword", password_confirmation: "adminpassword")
admin.save!

teacher = User.find_or_initialize_by(email: "teacher@example.com")
teacher.assign_attributes(first_name: "Test", last_name: "Teacher", role: "teacher",
                          password: "changeme!", password_confirmation: "changeme!")
teacher.save!

parent = User.find_or_initialize_by(email: "parent@example.com")
parent.assign_attributes(first_name: "Test", last_name: "Parent", role: "parent",
                         password: "changeme!", password_confirmation: "changeme!")
parent.save!

puts "Seeding accommodations..."
a_pres = Accommodation.find_or_create_by!(name: "Chunked Text") do |a|
  a.accommodation_type = :presentation
  a.details = "Shorter passages, bolded keywords."
end

a_set = Accommodation.find_or_create_by!(name: "Preferential Seat") do |a|
  a.accommodation_type = :setting
  a.details = "Front-left, minimal distractions."
end

a_res = Accommodation.find_or_create_by!(name: "Speech-to-Text Software") do |a|
  a.accommodation_type = :response
  a.details = "Utilize an application on the student's school distributed iPad."
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
s3 = Student.find_or_create_by!(first_name: "Michael", last_name: "Clancy") do |s|
  s.dob = Date.new(1997, 10, 30)
  s.diagnosis = "Too Smart"
  s.grade_level = "12"
end
s4 = Student.find_or_create_by!(first_name: "Nyles", last_name: "Johnson") do |s|
  s.dob = Date.new(2008, 9, 7)
  s.diagnosis = "Autism Spectrum Disorder"
  s.grade_level = "K"
end

s1.update!(parent: parent)
s2.update!(parent: parent)

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
g_life = Goal.find_or_create_by!(name: "Laundry") do |g|
  g.objectives = "Follow all steps of doing laundry."
  g.category = "Life Skills"
  g.active = true
end
g_behave = Goal.find_or_create_by!(name: "Attend to Task") do |g|
  g.objectives = "Attend to classroom task over five four minute intervals."
  g.category = "Life Skills"
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
  sg.status = "in_progress"
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

sg4 = StudentGoal.find_or_create_by!(student: s2, goal: g_behave) do |sg|
  sg.start_on = Date.today - 21
  sg.target_date = Date.today + 75
  sg.baseline = "Rubric 1"
  sg.target_value = "Rubric 3"
  sg.status = "in_progress"
  sg.mastery_percent = 30
end

sg5 = StudentGoal.find_or_create_by!(student: s3, goal: g_life) do |sg|
  sg.start_on = Date.today - 10
  sg.target_date = Date.today + 180
  sg.baseline = "Rubric 1"
  sg.target_value = "Rubric 3"
  sg.status = "planned"
  sg.mastery_percent = 90
end

sg6 = StudentGoal.find_or_create_by!(student: s4, goal: g_math) do |sg|
  sg.start_on = Date.today - 100
  sg.target_date = Date.today + 100
  sg.baseline = "Rubric 1"
  sg.target_value = "Rubric 4"
  sg.status = "planned"
  sg.mastery_percent = 85
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
ProgressEntry.find_or_create_by!(student_goal: sg2, user: teacher, recorded_on: Date.today - 4) do |pe|
  pe.note = "Dude doesn't know a thing."
  pe.score_numeric = 0
end
ProgressEntry.find_or_create_by!(student_goal: sg2, user: teacher, recorded_on: Date.today - 3) do |pe|
  pe.note = "Clueless...."
  pe.score_numeric = 0
end
ProgressEntry.find_or_create_by!(student_goal: sg2, user: teacher, recorded_on: Date.today - 2) do |pe|
  pe.note = "Beginning to quesiton my abilities as a teacher."
  pe.score_numeric = 0
end
ProgressEntry.find_or_create_by!(student_goal: sg2, user: teacher, recorded_on: Date.today - 1) do |pe|
  pe.note = "Am I getting pranked?"
  pe.score_numeric = 0
end
ProgressEntry.find_or_create_by!(student_goal: sg3, user: teacher, recorded_on: Date.today - 3) do |pe|
  pe.note = "Organizer used
 2 paragraphs with topic sentences."
  pe.score_numeric = 70
end
ProgressEntry.find_or_create_by!(student_goal: sg3, user: teacher, recorded_on: Date.today - 1) do |pe|
  pe.note = "Organizer used
 3 paragraphs with topic sentences."
  pe.score_numeric = 75
end
ProgressEntry.find_or_create_by!(student_goal: sg4, user: teacher, recorded_on: Date.today - 30) do |pe|
  pe.note = "Wouldn't sit down."
  pe.score_numeric = 0
end
ProgressEntry.find_or_create_by!(student_goal: sg4, user: teacher, recorded_on: Date.today - 20) do |pe|
  pe.note = "Attended 3 of 5 intervals."
  pe.score_numeric = 60
end
ProgressEntry.find_or_create_by!(student_goal: sg4, user: teacher, recorded_on: Date.today - 10) do |pe|
  pe.note = "Attended 2 of 5 intervals."
  pe.score_numeric = 40
end
ProgressEntry.find_or_create_by!(student_goal: sg4, user: teacher, recorded_on: Date.today - 20) do |pe|
  pe.note = "Attended 3 of 5 intervals."
  pe.score_numeric = 60
end
ProgressEntry.find_or_create_by!(student_goal: sg5, user: teacher, recorded_on: Date.today - 10) do |pe|
  pe.note = "Can start machines, could not fold or locate correct locations for clothes."
  pe.score_numeric = 60
end
ProgressEntry.find_or_create_by!(student_goal: sg5, user: teacher, recorded_on: Date.today - 20) do |pe|
  pe.note = "Only seemed to understand putting the clothes in the dryer."
  pe.score_numeric = 20
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
StudentAccommodation.find_or_create_by!(student: s3, accommodation: a_res) do |sa|
  sa.start_on = Date.today - 5
  sa.notes = "Use speech-to-text to response to small-group questions."
end
StudentAccommodation.find_or_create_by!(student: s3, accommodation: a_set) do |sa|
  sa.start_on = Date.today - 5
  sa.notes = "Seat near teacher for small-group."
end
