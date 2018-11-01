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
    it "counts the numbers of elements in the cache" do
      lrucache.add("I walk the line")
      lrucache.add(5)
      lrucache.add(:ring_of_fire)
      lrucache.add({a: 1, b: 2, c: 3})
      expect(lrucache.count).to eq(4)
    end
    it "ignores empty values in the cache" do
      lrucache.add("I walk the line")
      lrucache.add(5)
      expect(lrucache.count).to eq(2)
    end
  end

  describe "#add" do

  end

end
