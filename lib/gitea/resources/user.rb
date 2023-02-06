module Gitea
  class UserResource < Resource
    
    def get
      User.new get_request("user").body
    end

    def emails
      response = get_request("user/emails")
      Collection.from_response(response, type: Email)
    end

  end
end
