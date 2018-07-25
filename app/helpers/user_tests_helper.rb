module UserTestsHelper
Result = Struct.new(:color, :outcome)

  def result_outcome(user_test)
    if user_test.success?
      Result.new(:green, :successful)
    else
      Result.new(:red, :failed)
    end
  end
end
