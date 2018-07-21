class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_first_or_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def questions_count
    test.questions.count
  end

  def current_question_num
    test.questions.index(self.current_question) + 1
  end

  def results
    (self.correct_questions.to_f / questions_count) * 100
  end

  def good?
    results >= 85 ? true : false
  end

  private

  def before_save_set_first_or_next_question
    if current_question.nil?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
#    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
#    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
