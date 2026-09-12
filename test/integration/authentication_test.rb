require "test_helper"

class AuthenticationTest < ActionDispatch::IntegrationTest
  test "signs in with valid credentials" do
    post user_session_path, params: {
      user: { email: users(:one).email, password: "password123" }
    }

    assert_response :redirect
    assert_equal "Signed in successfully.", flash[:notice]
  end
end
