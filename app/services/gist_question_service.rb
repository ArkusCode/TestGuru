class GistQuestionService

  ResultObject = Struct.new(:success?, :data)

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    gist = @client.create_gist(gist_params)
    ResultObject.new(gist&.html_url.present?, gist)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist', test_title: @test.title),
      files: {
        'test-guru-questions.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
