module LarvataOrganization
  module Service
    class OrgNodes
      class << self
        def create_company_node(uuid, name, office_address)
          company = LarvataOrganization::Factory::Orgs.create_company(uuid, name, office_address)
          root = LarvataOrganization::Factory::Nodes.create_root(company)
          {
            organization: company,
            tree_node: root
          }
        end

        def add_org_node(parent_node, typing, name, code)
          org = LarvataOrganization::Factory::Orgs.create_org(typing, name, code)
          node = LarvataOrganization::Factory::Nodes.create_child(parent_node, org)
          {
            organization: org,
            tree_node: node
          }
        end
      end
    end
  end
end
