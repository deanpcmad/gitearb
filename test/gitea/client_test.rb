require "test_helper"

class ClientTest < Minitest::Test
  def test_url
    client = Gitea::Client.new url: "https://gitea.com", access_token: "abc123"
    assert_equal "https://gitea.com", client.url
  end

  def test_access_token
    client = Gitea::Client.new url: "https://gitea.com", access_token: "abc123"
    assert_equal "abc123", client.access_token
  end
end
