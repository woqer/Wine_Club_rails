require 'test_helper'

class Vin::NotesControllerTest < ActionController::TestCase

  test "notes index" do
    get :index, sub_id: 1, shipment_id: 1
    assert_response :success
  end

  test "notes create" do
    post :create, sub_id: 1, shipment_id: 1, content: "Vega Sicilia Unico is one of the finest wines in the world!"
    assert_response :success
  end

  test "notes show" do
    get :show, id: 1
    assert_response :success
  end

  test "notes update" do
    put :update, id: 1, content: "Vega Sicilia Unico is one of the finest wines in the world!"
    assert_response :success
  end

  test "notes destroy" do
    delete :destroy, id: 1
    assert_response :success
  end

end
