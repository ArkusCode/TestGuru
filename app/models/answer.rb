class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true)}

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  def validate_max_answers
    errors.add(:base, 'Must have 1 to 4 answers') if question.answers.count > 4
  end
end
