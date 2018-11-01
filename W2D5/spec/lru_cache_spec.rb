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
    context "when the element does not already exist in the cache" do
      it "adds new elements to the cache" do
        lrucache.add("I walk the line")
        lrucache.add(5)
        lrucache.add(:ring_of_fire)
        lrucache.add({a: 1, b: 2, c: 3})
        expect(lrucache.cache).to eq(["I walk the line", 5, :ring_of_fire, {a: 1, b: 2, c: 3}])
      end
    end
    context "when the element already exists in the cache" do
      it "does not add the element again" do
        lrucache.add("I walk the line")
        lrucache.add(5)
        lrucache.add("I walk the line")
        lrucache.add(:ring_of_fire)
        expect(lrucache.cache).not_to eq(["I walk the line", 5, "I walk the line", :ring_of_fire])
      end
      it "changes the position of the element" do
        lrucache.add("I walk the line")
        lrucache.add("I walk the line")
        expect(lrucache.cache[-1]).to eq("I walk the line")
        expect(lrucache.cache[-2]).not_to eq("I walk the line")
      end
    end
  end

  describe "#show" do
    it "shows the cache when prompted" do
      lrucache.add("I walk the line")
      expect(lrucache.show).to eq([nil, nil, nil, "I walk the line"])
    end
  end

end
