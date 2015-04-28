require 'test_helper'

class Vin::MonthlyControllerTest < ActionController::TestCase

  def initialize(options={})
    super(options)
    @sub_json = read_sub
  end

  def read_data example
    file = File.read(File.join(Rails.root, "lib","data", example))
    JSON.parse(file)
  end

  def read_sub example="wines.json"
    read_data example
  end

  test "monthly selection create" do
    post :create, @sub_json
    assert_response :success
  end

  test "monthly selection show" do
    get :show, id: 1
    assert_response :success
  end

  test "monthly selection index" do
    get :index
    assert_response :success
  end

end
