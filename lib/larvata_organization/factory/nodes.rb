module LarvataOrganization
  module Factory
    class Nodes
      class << self
        def create_root(org)
          LarvataOrganization.tree_node_class.company.enabled.create(nodeable: org, code: org.uuid, name: org.abbrev_name)
        end
      end
    end
  end
end
