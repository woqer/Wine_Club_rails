require 'test_helper'

class ShipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "serializable_hash updated_at" do
    out = shipments(:one).serializable_hash.symbolize_keys
    assert_nil(out[:updated_at], "Updated_At is outputed!")
    assert_nil(out[:created_at], "Created_At is outputed!")
    assert_nil(out[:date], "date outputed!")
  end

  test "instance method selection month" do
    out = shipments(:one).selection_month
    assert_not_nil(out[:id], "Not id present...")
    assert_not_nil(out[:selection_month], "Not selection_month present...")
    assert_not_nil(out[:status], "Not status present...")
    assert_nil(out[:date], "Date present! should be formatted in selection_month")
  end

  test "class method selection month" do
    outs = Shipment.all.selection_month
    assert_not_nil(outs[0][:id], "Not id present in 0")
    assert_not_nil(outs[1][:id], "Not id present in 1")
    assert_not_nil(outs[2][:id], "Not id present in 2")
    assert_not_nil(outs[0][:selection_month], "Not selection_month present in 0...")
    assert_not_nil(outs[1][:selection_month], "Not selection_month present in 1...")
    assert_not_nil(outs[2][:selection_month], "Not selection_month present in 2...")
    assert_not_nil(outs[0][:status], "Not status present in 0...")
    assert_not_nil(outs[1][:status], "Not status present in 1...")
    assert_not_nil(outs[2][:status], "Not status present in 2...")
    assert_nil(outs[0][:date], "Date present! should be formatted in selection_month in 0")
    assert_nil(outs[1][:date], "Date present! should be formatted in selection_month in 1")
    assert_nil(outs[2][:date], "Date present! should be formatted in selection_month in 2")
  end

  test "instance method show" do
    out = shipments(:one).show
    assert_nil(out[:id], "id should not be showed")
    assert_not_nil(out[:selection_month], "selection_month not present!")
    assert_not_nil(out[:date], "date not present")
    assert_not_nil(out[:type], "type not present")
    assert_not_nil(out[:wines], "wines not present")
  end
end
