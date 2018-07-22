module UserTestsHelper
  def result_markup(user_test)
  result = Struct.new(:color, :outcome)
    if user_test.success?
      result.new(:green, :successful)
    else
      result.new(:red, :failed)
    end
  end
end
