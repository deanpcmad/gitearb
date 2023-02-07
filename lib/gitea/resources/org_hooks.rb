module Gitea
  class OrgHooksResource < Resource

    def list(org:, **params)
      response = get_request("orgs/#{org}/hooks", params: params)
      Collection.from_response(response, type: Hook)
    end

    def get(org:, id:)
      Hook.new get_request("orgs/#{org}/hooks/#{id}").body
    end

    def create(org:, url:, type:, **args)
      data = {config: {content_type: "json", url: url}, type: type}
      Hook.new post_request("orgs/#{org}/hooks", body: args.merge(data)).body
    end

    def update(org:, id:, **args)
      Hook.new patch_request("orgs/#{org}/hooks/#{id}", body: args).body
    end

    def delete(org:, id:)
      delete_request("orgs/#{org}/hooks/#{id}")
    end

  end
end
