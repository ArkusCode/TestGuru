class Badge < ApplicationRecord
  has_many :user_badges, dependent: :delete_all
  has_many :users, through: :user_badges

  before_save :set_cover_if_blank

  validates :title, presence: true
  validates :rule, presence: true

  BADGES_NAMES = { 'С первой попытки' => :test_first_try , 'Все тесты категории' => :all_tests_category, 'Все тесты уровня' => :all_tests_level }.freeze

  private

  def set_cover_if_blank
    self.cover = '../../badge.jpg' if cover.blank?
  end
end
