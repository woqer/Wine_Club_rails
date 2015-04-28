require 'test_helper'
require "pry"

class Vin::NotesControllerTest < ActionController::TestCase

  def initialize(options={})
    super(options)
    @sub_json = read_sub
  end

  def read_data example
    file = File.read(File.join(Rails.root, "lib","data", example))
    JSON.parse(file)
  end

  def read_sub example="note.json"
    read_data example
  end

  test "notes index" do
    get :index, sub_id: 1, shipment_id: 1
    assert_response :success
  end

  test "notes create" do
    post :create, sub_id: 1, shipment_id: 1, @sub_json
    assert_response :success
  end

  test "notes show" do
    get :show, id: 1
    assert_response :success
  end

  test "notes update" do
    put :update, id: 1, @sub_json
    assert_response :success
  end

  test "notes destroy" do
    delete :destroy, id: 1
    assert_response :success
  end

end
