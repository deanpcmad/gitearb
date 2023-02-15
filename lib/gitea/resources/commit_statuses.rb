module Gitea
  class CommitStatusesResource < Resource

    def list(owner:, repo:, sha:, **params)
      response = get_request("repos/#{owner}/#{repo}/statuses/#{sha}", params: params)
      Collection.from_response(response, type: CommitStatus)
    end

    def create(owner:, repo:, sha:, **args)
      CommitStatus.new post_request("repos/#{owner}/#{repo}/statuses/#{sha}", body: args).body
    end

  end
end
