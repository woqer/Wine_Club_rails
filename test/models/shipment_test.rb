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
    assert_equal(out, "Mar/2015")
  end

  test "class method selection month" do
    out = Shipment.all.selection_month
    assert_equal(out, ["Mar/2015", "Apr/2015", "Jun/2015"])
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
