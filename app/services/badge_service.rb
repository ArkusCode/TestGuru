class BadgeService

  def initialize(user_test)
    @user = user_test.user
    @test = user_test.test
    @user_test = user_test
  end

  def call
    Badge.all.find_each do |badge|
      add_badge(badge.title) if send("add_for_#{badge.title}", badge.rule)
    end
  end

  private

  def add_for_test_first_try(_params)
    UserTest.where(user: @user, test: @test).count == 1 if @user_test.success?
  end

  def add_for_all_tests_category(title)
    category_tests_ids = Category.find_by(title: title).tests.ids

    (category_tests_ids - successful_tests_uniq_ids).empty?
  end

  def add_for_all_tests_level(level)
    tests_by_level_ids = Test.where(level: level).ids

    (tests_by_level_ids - successful_tests_uniq_ids).empty?
  end

  def successful_tests_uniq_ids
    successful_tests.map(&:test_id).uniq
  end

  def successful_tests
    UserTest.where(user: @user, current_question: nil).select(&:success?)
  end

  def add_badge(title)
    badge = Badge.find_by(title: title)
    @user.user_badges.create(badge: badge).save
  end
end
