require "faraday"
require "json"
require "gitea/version"

module Gitea

  autoload :Client, "gitea/client"
  autoload :Collection, "gitea/collection"
  autoload :Error, "gitea/error"
  autoload :Resource, "gitea/resource"
  autoload :Object, "gitea/object"
  

  autoload :UserResource, "gitea/resources/user"

  autoload :User, "gitea/objects/user"
  autoload :Email, "gitea/objects/email"

end
