
  User.create(username: "Frank", password: "frankenfreuter")
  User.create(username: "John", password: "frankenfreuter")
  User.create(username: "3Frank", password: "frankenfreuter")
  User.create(username: "3John", password: "frankenfreuter")
  User.create(username: "2Frank", password: "frankenfreuter")
  User.create(username: "2John", password: "frankenfreuter")
  User.create(username: "1Frank", password: "frankenfreuter")
  User.create(username: "1John", password: "frankenfreuter")

10.times do
  Question.create(title: "How do you do this", body: "I was wondering how you would do this and that and this and that", user_id: rand(1..2))
end

10.times do
  Answer.create(content: "Here's how you do this", user_id: rand(1..2), question_id: rand(1..10))
end

10.times do
  Comment.create(content: "Here's how you do this", user_id: rand(1..2), answer_id: rand(1..10))
end

6.times do
  Vote.create(votable_type: "Answer", votable_id: rand(1..10))
end


