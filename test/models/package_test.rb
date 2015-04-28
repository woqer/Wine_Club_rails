require 'test_helper'

class PackageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "serializable_hash updated_at" do
    out = packages(:one).serializable_hash.symbolize_keys
    assert_nil(out[:updated_at], "Updated_At is outputed!")
    assert_nil(out[:created_at], "Created_At is outputed!")
    assert_nil(out[:shipment_id], "shipment_id is outputed!")
  end

  test "instance method uniq wines" do
    wine_ar = packages(:one).uniq_wines
    wine_aw = packages(:two).uniq_wines
    wine_rw = packages(:three).uniq_wines
    assert(wine_ar.size == 1, "AR not size 1 (was #{wine_ar})")
    assert(wine_aw.size == 1, "AW not size 1 (was #{wine_aw})")
    assert(wine_rw.size == 2, "RW not size 2 (was #{wine_rw})")
  end

  test "class method uniq wines" do
    package_wines = Package.uniq_wines
    assert(package_wines[0].size == 1, "All packages must have uniq_wines (was #{package_wines[0]})")
    assert(package_wines[1].size == 1, "All packages must have uniq_wines (was #{package_wines[1]})")
    assert(package_wines[2].size == 2, "All packages must have uniq_wines (was #{package_wines[2]})")
  end
end
