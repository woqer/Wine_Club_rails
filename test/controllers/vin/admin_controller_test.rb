require 'test_helper'

class Vin::AdminControllerTest < ActionController::TestCase

  test "admin create" do
    get :create, name: "Fido Admin"
    assert_response :success
  end

  test "admin index" do
    get :index
    assert_response :success
  end

  test "admin show" do
    get :show, id: 1
    assert_response :success
  end

  test "admin update" do
    get :update, id: 1, name: "Fido Admin"
    assert_response :success
  end

end
