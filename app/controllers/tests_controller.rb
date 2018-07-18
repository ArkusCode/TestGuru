class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy edit]

  def index
    @tests = Test.all
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
