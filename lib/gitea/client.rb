module Gitea
  class Client
    # BASE_URL = "https://api.buildkite.com/v2"

    attr_reader :url, :access_token, :adapter

    def initialize(url:, access_token:, adapter: Faraday.default_adapter, stubs: nil)
      @url = url
      @access_token = access_token
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def user
      UserResource.new(self)
    end

    def user_repos
      UserReposResource.new(self)
    end

    def orgs
      OrgsResource.new(self)
    end

    def org_hooks
      OrgHooksResource.new(self)
    end

    def repos
      ReposResource.new(self)
    end

    def repo_hooks
      RepoHooksResource.new(self)
    end

    def commit_statuses
      CommitStatusesResource.new(self)
    end

    def connection
      full_url = [url, "api/v1"].join("/")

      @connection ||= Faraday.new(full_url) do |conn|
        conn.request :authorization, :token, access_token
        
        conn.headers = {
          "User-Agent" => "gitearb/v#{VERSION} (github.com/deanpcmad/gitearb)"
        }
        
        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end

  end
end
