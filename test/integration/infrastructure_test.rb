require "test_helper"

class InfrastructureTest < ActionDispatch::IntegrationTest
  test "health endpoint responds" do
    get rails_health_check_path

    assert_response :success
  end

  test "Trestle admin and assets load through Propshaft" do
    assert Rails.application.assets.load_path.find("application.css")
    assert Rails.application.assets.load_path.find("application.js")
    assert Rails.application.assets.load_path.find("trestle/admin.css")
    assert Rails.application.assets.load_path.find("trestle/admin.js")

    get "/admin"
    assert_response :success
  end
end
