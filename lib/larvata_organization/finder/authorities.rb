module LarvataOrganization
  module Finder
    class Authorities
      attr_reader :company_node

      def initialize(uuid)
        @company_node =  LarvataOrganization.tree_node_class.roots.includes(:nodeable, :children).find_by_code(uuid)
      end

      def manager_users
        manager_nodes = company_node.find_all_by_generation(2).manager.includes(:nodeable, :parent, :children)

        {}.tap do |nodes_hash|
          manager_nodes.find_each do |node|
            nodes_hash[node.parent.code] = {
              name: node.parent.name,
              user_ids: node.children.pluck(:nodeable_id)
            }
          end
        end.symbolize_keys
      end
    end
  end
end
