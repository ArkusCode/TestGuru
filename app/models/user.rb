class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :user_tests
  has_many :tests, through: :user_tests

  def test_by_level(level)
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(level: level, user_tests: { user_id: id })
  end
end
