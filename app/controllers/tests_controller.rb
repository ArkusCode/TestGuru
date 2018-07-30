class TestsController < AuthenticatedController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_test, only: :start

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.user_test(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
