require 'test_helper'

class Vin::SubControllerTest < ActionController::TestCase

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

  test "should post create" do
    post :create, @sub_json
    assert_response :success
  end

  test "should post create error (subscriber already registered)" do
    post :create, read_sub("sub.json")
    msg = JSON.parse(@response.body)
    assert_equal(["Subscriber already registered!"], msg["errors"], "Got: #{msg}")
  end

  test "should get show" do
    get :show, id: 1
    assert_response :success
  end

  test "should put update" do
    put :update, @sub_json.merge({id: 1})
    assert_response :success
  end

  test "should put update error" do
    put :update, {id: 1, subscriber: {address: { state: "" }}}
    msg = JSON.parse(@response.body)
    puts "Mensage de error...#{msg}"
    assert_not_equal({ errors: [] }, msg)
  end

end
