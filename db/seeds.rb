# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Frontend' },
                              { title: 'Backend' },
                              { title: 'Mobile Development' }])

tests = Test.create!([{ title: 'Ruby', level: 0,
                       category_id: categories[1].id },
                     { title: 'HTML', level: 2,
                       category_id: categories[0].id },
                     { title: 'Swift', level: 1,
                       category_id: categories[2].id }])

questions = Question.create!([{ body: 'Ruby question 1',
                               test_id: tests[0].id },
                             { body: 'HTML question 2',
                               test_id: tests[1].id },
                             { body: 'Swift question 1',
                               test_id: tests[2].id }])

answers = Answer.create!([{ body: 'Wrong answer 1',
                           question_id: questions[0].id },
                         { body: 'Wrong answer 2',
                           question_id: questions[0].id },
                         { body: 'Correct answer',
                           question_id: questions[0].id, correct: true }])

users = User.create!([{ email: 'foo1@bar.com',
                       first_name: 'John',
                       last_name: 'Doe'},
                     { email: 'foo2@bar.com',
                        first_name: 'Jane',
                       last_name: 'Doe' }])

UserTest.create!([{ user_id: users[0].id, test_id: tests[0].id },
                  { user_id: users[0].id, test_id: tests[1].id },
                  { user_id: users[0].id, test_id: tests[2].id }])
