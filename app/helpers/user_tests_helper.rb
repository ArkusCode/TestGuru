module UserTestsHelper
  def results_msg(user_test)
    "You answered correctly on #{user_test.results.to_i}% of the questions"
  end
end
