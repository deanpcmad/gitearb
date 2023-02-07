module Gitea
  class OrgsResource < Resource

    def list(**params)
      response = get_request("orgs", params: params)
      Collection.from_response(response, type: Org)
    end
    
    def get(name:)
      Org.new get_request("orgs/#{name}").body
    end

    def create(name:, **args)
      Org.new post_request("orgs", body: args.merge({username: name})).body
    end

    def update(name:, **args)
      Org.new patch_request("orgs/#{name}", body: args).body
    end

    def delete(name:)
      delete_request("orgs/#{name}")
    end

  end
end
