require 'test_helper'

class Vin::WinesControllerTest < ActionController::TestCase
  
  test "wines index" do
    get :index, sub_id: 1
    assert_response :success
  end

  test "wines show" do
    get :show, id: 1
    assert_response :success
  end

  test "wines rating get" do
    get :rating, sub_id: 1, id: 1
    assert_response :success
  end

  test "wines rating post" do
    get :rating, sub_id: 1, id: 1, rating: 7
    assert_response :success
  end

  test "wines show route GET /vin/sub/:uid/wines/:wid" do
    assert_recognizes({controller: :wines, action: :show, sub_id: 1, id: 1},
      "/vin/sub/#{:sub_id}/wines/#{:id}")
  end

  test "wines show route GET /vin/wines/:wid" do
    assert_recognizes({controller: :wines, action: :show, id: 1},
      "/vin/wines/#{:id}")
  end

end
