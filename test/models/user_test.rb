require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "authenticates with Devise database credentials" do
    assert users(:one).valid_password?("password123")
    refute users(:one).valid_password?("wrong-password")
  end

  test "keeps expected Devise modules" do
    expected = %i[database_authenticatable registerable recoverable rememberable validatable]

    assert_equal expected.sort, User.devise_modules.sort
  end
end
