class UserTestsController < AuthenticatedController
  before_action :find_user_test, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @user_test.accept!(params[:answer_ids])

    if @user_test.completed?
      TestsMailer.completed_test(@user_test).deliver_now
      redirect_to result_user_test_path(@user_test)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@user_test.current_question).call

    flash_options = if result.success?
      current_user.gists.create!(question: @user_test.current_question, url: result.data.html_url)
      { notice: t('.success', url: view_context.link_to("gist.github.com", result.data.html_url, target: :blank)) }
    else
      { notice: t('.failure') }
    end

    redirect_to @user_test, flash_options
  end

  private

  def find_user_test
    @user_test = UserTest.find(params[:id])
  end
end
