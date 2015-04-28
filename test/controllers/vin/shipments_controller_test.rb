require 'test_helper'
require "pry"

class Vin::ShipmentsControllerTest < ActionController::TestCase

  test "shipment index" do
    get :index, sub_id: 1
    assert_response :success
  end

  test "shipment show" do
    get :show, sub_id: 1, id: 1
    assert_response :success
  end

end
