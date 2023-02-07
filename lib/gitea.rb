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
  autoload :OrgsResource, "gitea/resources/orgs"
  autoload :OrgHooksResource, "gitea/resources/org_hooks"

  autoload :User, "gitea/objects/user"
  autoload :Email, "gitea/objects/email"
  autoload :Org, "gitea/objects/org"
  autoload :Hook, "gitea/objects/hook"

end
