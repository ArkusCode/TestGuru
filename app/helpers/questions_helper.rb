module QuestionsHelper
  def question_header(question)
    header = question.persisted? ? "Edit " : "Create new "
    header + "#{question.test.title} #{test_level(question.test)} test question."
  end
end
