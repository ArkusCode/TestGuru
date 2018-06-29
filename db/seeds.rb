# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ title: 'Frontend' },
                 { title: 'Backend' },
                 { title: 'Mobile Development' }])

Test.create([{ title: 'Ruby', level: 0,
               category_id: 2 },
             { title: 'HTML', level: 2,
               category_id: 1 },
             { title: 'Swift', level: 1,
               category_id: 3 }])

Question.create([{ body: 'Ruby question 1',
                   test_id: 1 },
                 { body: 'HTML question 2',
                   test_id: 2 },
                 { body: 'Swift question 1',
                   test_id: 3 }])

Answer.create([{ body: 'Wrong answer 1',
                 question_id: 1 },
               { body: 'Wrong answer 2',
                 question_id: 1 },
               { body: 'Correct answer',
                 question_id: 1, correct: true }])

User.create([{ email: 'foo1@bar.com',
               first_name: 'John',
               last_name: 'Doe'},
             { email: 'foo2@bar.com',
               first_name: 'Jane',
               last_name: 'Doe' }])

UserTest.create([{ user_id: 1, test_id: 1 },
                 { user_id: 1, test_id: 2 },
                 { user_id: 1, test_id: 3 }])
