class User < ApplicationRecord

  EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :user_tests
  has_many :tests, through: :user_tests

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, format: { with: EMAIL_FORMAT, message: "bad format" }

  has_secure_password

  def test_by_level(level)
    tests.where(level: level)
  end

  def user_test(test)
    user_tests.order(id: :desc).find_by(test: test)
  end
end
