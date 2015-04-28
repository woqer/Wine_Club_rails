require 'test_helper'
require "pry"

class Vin::PartnerControllerTest < ActionController::TestCase

  test "partner index" do
    get :index
    assert_response :success
  end

end
