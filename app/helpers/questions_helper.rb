module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.test.title} #{test_level(question.test)} test question."
    else
      "Create new #{question.test.title} #{test_level(question.test)} test question."
    end
  end
end
