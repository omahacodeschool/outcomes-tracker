module ApplicationHelper
  def twitter_url(username)
    "http://twitter.com/#{username}"
  end

  def github_url(username)
    "http://github.com/#{username}"
  end
end
