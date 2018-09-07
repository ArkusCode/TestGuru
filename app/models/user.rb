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
  has_many :user_badges, dependent: :delete_all
  has_many :badges, through: :user_badges
  has_many :gists
  has_many :feedbacks

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

  def successful_tests
    self.user_tests.where(current_question: nil).select(&:success?)
  end
end
