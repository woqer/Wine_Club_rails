require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

describe VinClient do
  before do
    @vin = VinClient.new
    puts "Oye tuuuuuuu #{@vin}"
  end
  describe "@vin post_sub" do
    response = @vin.post_sub
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin put_sub" do
    response = @vin.put_sub(1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_sub" do
    response = @vin.get_sub(1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_sub_wines_search" do
    response = @vin.get_sub_wines_search(1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_shipments" do
    response = @vin.get_shipments(1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_shipment" do
    response = @vin.get_shipment(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin put_shipment" do
    response = @vin.put_shipment(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_shipment_notes" do
    response = @vin.get_shipment_notes(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin post_shipment_notes" do
    response = @vin.post_shipment_notes(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_shipment_note" do
    response = @vin.get_shipment_note(1, 1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin put_shipment_note" do
    response = @vin.put_shipment_note(1, 1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin delete_shipment_note" do
    response = @vin.delete_shipment_note(1, 1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_wines" do
    response = @vin.get_wines(1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_wine" do
    response = @vin.get_wine(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_wine_notes" do
    response = @vin.get_wine_notes(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin post_wine_notes" do
    response = @vin.post_wine_notes(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_wine_note" do
    response = @vin.get_wine_note(1, 1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin put_wine_note" do
    response = @vin.put_wine_note(1, 1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin delete_wine_note" do
    response = @vin.delete_wine_note(1, 1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_wine_rating" do
    response = @vin.get_wine_rating(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin post_wine_rating" do
    response = @vin.post_wine_rating(1, 1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_user_delivery" do
    response = @vin.get_user_delivery(1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin put_user_delivery" do
    response = @vin.put_user_delivery(1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin post_admin" do
    response = @vin.post_admin
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_admins" do
    response = @vin.get_admins
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin get_admin" do
    response = @vin.get_admin(1)
    assert_not_nil(response, "Response was nil!!!")
  end
  describe "@vin put_admin" do
    response = @vin.put_admin(1)
    assert_not_nil(response, "Response was nil!!!")
  end
end