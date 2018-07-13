class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def show
  end

  def index
    @question = @test.questions
    render inline: '<% @question.each { |q| %><p><%= q.body %></p><% } %>'
  end

  def new
  end

  def create
    @test.questions.create(question_params)
  end

  def destroy
    @question.destroy
  end

  private

  def rescue_from_question_not_found
    render plain: 'Request not found'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
