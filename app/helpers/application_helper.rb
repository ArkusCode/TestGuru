module ApplicationHelper
FLASH_TYPE = { notice: 'alert-primary', alert: 'alert-warning' }

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_type(name)
    FLASH_TYPE[name.to_sym]
  end
end
