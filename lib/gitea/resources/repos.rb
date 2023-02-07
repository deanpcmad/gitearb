module Gitea
  class ReposResource < Resource
    
    def search(**params)
      response = get_request("repos/search", params: params)
      Collection.from_response(response, type: Repo, kind: "data")
    end

    def get(owner:, repo:)
      Repo.new get_request("repos/#{owner}/#{repo}").body
    end

    def update(owner:, repo:, **args)
      Repo.new patch_request("repos/#{owner}/#{repo}", body: args).body
    end

    def delete(owner:, repo:)
      delete_request("repos/#{owner}/#{repo}")
    end

  end
end
