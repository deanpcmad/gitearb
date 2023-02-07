module Gitea
  class RepoHooksResource < Resource
    
    def list(owner:, repo:, **params)
      response = get_request("repos/#{owner}/#{repo}/hooks", params: params)
      Collection.from_response(response, type: Hook)
    end

    def get(owner:, repo:, id:)
      Hook.new get_request("repos/#{owner}/#{repo}/hooks/#{id}").body
    end

    def create(owner:, repo:, url:, type:, **args)
      data = {config: {content_type: "json", url: url}, type: type}
      Hook.new post_request("repos/#{owner}/#{repo}/hooks", body: args.merge(data)).body
    end

    def test(owner:, repo:, id:)
      post_request("repos/#{owner}/#{repo}/hooks/#{id}/tests", body: {})
    end

    def update(owner:, repo:, id:, **args)
      Hook.new patch_request("repos/#{owner}/#{repo}/hooks/#{id}", body: args).body
    end

    def delete(owner:, repo:, id:)
      delete_request("repos/#{owner}/#{repo}/hooks/#{id}")
    end

  end
end
