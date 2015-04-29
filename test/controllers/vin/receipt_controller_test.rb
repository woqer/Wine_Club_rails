require 'test_helper'

class Vin::ReceiptControllerTest < ActionController::TestCase

  def initialize(options={})
    super(options)
    @sub_json = read_sub
  end

  def read_data example
    file = File.read(File.join(Rails.root, "lib","data", example))
    JSON.parse(file)
  end

  def read_sub example="sub2.json"
    read_data example
  end

  test "receipt create" do
    get :create, @sub_json
    assert_response :success
  end

  test "receipt index" do
    get :index
    assert_response :success
  end

  test "receipt show" do
    get :show, id: 1
    assert_response :success
  end

end
