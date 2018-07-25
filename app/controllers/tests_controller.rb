class TestsController < ApplicationController
  before_action :find_test, only: %i[show start]
  before_action :find_user, only: :start

  def index
    @tests = Test.all
  end

  def show
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.user_test(@test)
  end

  private

  def find_user
    @user = User.last
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
