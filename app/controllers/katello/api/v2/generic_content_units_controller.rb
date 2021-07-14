module Katello
  class Api::V2::GenericContentUnitsController < Api::V2::ApiController
    resource_description do
      name 'Generic'
    end
    apipie_concern_subst(:a_resource => N_("generic"), :resource_id => "generic contents")
    include Katello::Concerns::Api::V2::RepositoryContentController

    def default_sort
      %w(name asc)
    end

    private

    def repo_association
      :repository_id
    end
  end
end
