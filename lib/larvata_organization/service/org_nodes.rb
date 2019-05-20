module LarvataOrganization
  module Service
    class OrgNodes
      def create_company_node(uuid, name, office_address)
        company = LarvataOrganization::Factory::Orgs.create_company(uuid, name, office_address)
        root = LarvataOrganization::Factory::Nodes.create_root(company)
        {
          organization: company,
          tree_node: root
        }
      end

      def add_org_node()
      end
    end
  end
end
