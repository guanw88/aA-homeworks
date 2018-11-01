require 'lru_cache'

RSpec.describe LRUCache do
  subject(:lrucache) {LRUCache.new(4)}
  describe "#initialize" do
    it "initializes with an array of the appropriate size" do
      expect(lrucache.cache.length).to eq(4)
    end

    it "initializes with an empty cache" do
      expect(lrucache.cache).to eq([nil, nil, nil, nil])
    end
  end

  describe "#count" do
    it "counts the numbers of elements in the cache"
    it "ignores empty values in the cache"
  end

end
