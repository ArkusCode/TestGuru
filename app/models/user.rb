class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :user_tests
  has_many :tests, through: :user_tests

  validates :first_name, presence: true
  validates :last_name, presence: true
 # validates :email, uniqueness: true, format: { with: /@/, message: "bad format" }

  def test_by_level(level)
    tests.where(level: level)
  end

  def user_test(test)
    user_tests.order(id: :desc).find_by(test: test)
  end

  def admin?
    self.is_a?(Admin)
  end
end
