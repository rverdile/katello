require "katello_test_helper"
module Katello
  class Api::V2::GenericContentUnitsControllerTest < ActionController::TestCase
    include Support::ForemanTasks::Task

    def models
      @generic = GenericContentUnit.find(katello_generic_content_units(:one).id)
      @repo = Repository.find(katello_repositories(:pulp3_python_1).id)
    end

    def setup
      setup_controller_defaults_api
      models
      setup_product_permissions
    end

    def test_index
      get :index

      assert_response :success
      assert_template "katello/api/v2/generic_content_units/index"
    end

    def test_index_with_repo_id
      get :index, params: { :repository_id => @repo.id }

      assert_response :success
      assert_template "katello/api/v2/generic_content_units/index"
    end

    def test_show
      get :show, params: { :id => @generic.id }

      assert_response :success
      assert_template "katello/api/v2/generic_content_units/show"
    end

    def test_show_protected
      assert_protected_action(:show, @auth_permissions, @unauth_permissions) do
        get :show, params: { :id => @generic.id }
      end
    end
  end
end
