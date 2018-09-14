class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def results
    (self.correct_questions.to_f / self.test.questions.count) * 100
  end

  def success?
    results >= 85
  end

  def percent_completed
    (current_question_number.to_f / self.test.questions.count) * 100
  end

  def timeout?
    Time.current > active_time
  end

  def time_left
    (active_time - Time.current).to_i
  end

  private

  def before_save_set_next_question
    self.current_question = next_question
  end

  def active_time
    created_at + test.timer.seconds
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
