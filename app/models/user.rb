class User < ApplicationRecord
  def test_by_level(level)
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(level: level, user_tests: { user_id: id })
  end
end
