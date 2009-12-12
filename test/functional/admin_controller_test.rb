require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "redirects to login page and gives a proper message when user tries to access index page without logging in" do
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please log in before you start acting smart", flash[:notice]
  end
end
