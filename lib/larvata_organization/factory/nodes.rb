module LarvataOrganization
  module Factory
    class Nodes
      class << self
        def create_root(nodeable)
          org = nodeable[:nodeable]
          TreeNode.company.enabled.create(nodeable: org, code: org.uuid, name: org.abbrev_name)
        end
      end
    end
  end
end
