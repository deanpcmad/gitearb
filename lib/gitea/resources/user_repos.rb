module Gitea
  class UserReposResource < Resource
    
    def list(**params)
      response = get_request("user/repos", params: params)
      Collection.from_response(response, type: Repo)
    end

    def create(name:, **args)
      Repo.new post_request("user/repos", body: args.merge({name: name})).body
    end

  end
end
