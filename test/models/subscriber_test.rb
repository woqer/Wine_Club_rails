require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "serializable_hash updated_at" do
    out = subscribers(:one).serializable_hash.symbolize_keys
    assert_nil(out[:id], "id is outputed!")
    assert_nil(out[:updated_at], "Updated_At is outputed!")
    assert_nil(out[:created_at], "Created_At is outputed!")
    assert_nil(out[:address][:id], "address[:id]is outputed!")
    assert_nil(out[:address][:updated_at], "address[:updated_at]is outputed!")
    assert_nil(out[:address][:created_at], "address[:created_at]is outputed!")
  end

  test "email formatter" do
    sub = Subscriber.new
    email = sub.email_formatter "hola+sin.punto@ejemplo.com"
    assert( email == "holasinpunto@ejemplo.com", "Bad email formatter: #{email}")
  end

  test "search by email existent subscriber" do
    subs_by_email = Subscriber.search("jane.doe@example.com").first
    assert( subs_by_email == subscribers(:one), "Not found already existent sub: #{subs_by_email}")
  end

  test "search by email blank email" do
    subs_by_email = Subscriber.search("")
    assert( subs_by_email == Subscriber.all, "search blank does not match all: #{subs_by_email}")
  end

  test "search by email non existent user" do
    subs_by_email = Subscriber.search("asdf@adf.com")
    assert( subs_by_email.size == 0, "search non existent should return empty: #{subs_by_email}")
  end
end
