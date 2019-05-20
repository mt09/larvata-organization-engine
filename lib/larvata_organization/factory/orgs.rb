module LarvataOrganization
  module Factory
    class Orgs
      class << self
        def create_company(uuid, name, office_address)
          LarvataOrganization.organization_class.company.enabled.create(
            uuid: uuid,
            abbrev_name: name,
            full_name: name,
            code: "company_#{uuid}"
          )
        end
      end
    end
  end
end
