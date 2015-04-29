require 'test_helper'

class Vin::WinesControllerTest < ActionController::TestCase
  
  test "wines index for subscriber" do
    get :index, sub_id: 1
    assert_response :success
  end

  test "wines index" do
    get :index
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
    post :rating, { sub_id: 1, id: 1, rating: 7 }
    assert_response :success
  end

  test "wines rating put should be invalid request" do
    put :rating, { sub_id: 1, id: 1, rating: 7 }
    assert_equal(JSON.parse(@response.body), { "errors" => ["Invalid request"] })
  end

  test "wines show route GET /vin/sub/1/wines/1" do
    assert_recognizes({controller: :wines, action: :show, sub_id: 1, id: 1},
      "/vin/sub/1/wines/1")
  end

  test "wines show route GET /vin/wines/1" do
    assert_recognizes({controller: :wines, action: :show, id: 1},
      "/vin/wines/1")
  end

end
