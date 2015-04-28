require 'test_helper'

module VinSerializerTest
  def test_serializer
    test "get json without timestaps" do
      out = self.serializable_hash
      updated_at = out[:updated_at]
      created_at = out[:created_at]
      assert(updated_at | created_at)
    end
  end
end