require 'test_helper'
require "pry"

class Vin::AdminControllerTest < ActionController::TestCase

  def initialize(options={})
    super(options)
    @sub_json = read_sub
  end

  def read_data example
    file = File.read(File.join(Rails.root, "lib","data", example))
    JSON.parse(file)
  end

  def read_sub example="admin.json"
    read_data example
  end

  test "admin create" do
    post :create, @sub_json
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
    put :update, id: 1, @sub_json
    assert_response :success
  end

end
