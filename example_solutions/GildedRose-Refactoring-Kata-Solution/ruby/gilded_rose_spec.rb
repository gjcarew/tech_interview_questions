require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    # Write tests for functionality
    # See which are passing
    # Write private methods for exceptions, call them in #update_quality method
    it 'quality degrades' do 
      items = [Item.new("foo", 11, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(9)
    end

    it 'quality degrades twice as fast if past the sell in date' do 
      items = [Item.new("foo", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(8)
    end

    it 'Quality of an item is never negative' do
      items = [Item.new("foo", 0, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end

    it 'Aged brie increases in quality with age' do 
      items = [Item.new("Aged Brie", 5, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(2)
    end

    it 'Quality of an item is never more than 50' do 
      items = [Item.new("Aged Brie", 5, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end

    it 'Sulfuras does not need to be sold or decrease in quality' do 
      items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(80)
      expect(items[0].sell_in).to eq(5)
    end

    describe 'backstage passes' do 
      it 'Increases in quality as sell-in value approaches' do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(21)
      end

      it 'Quality increases by 2 when there are 10 days or less' do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(22)
      end

      it 'Quality increases by 3 when there are 5 days or less' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(22)
      end

      it 'Quality decreases to 0 when it hits the sell-in date (0)' do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(0)
      end
    end

    it 'Conjured items degrade twice as fast as regular items' do 
      items = [Item.new("Conjured", 10, 20), Item.new("Conjured", 0, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(18)
      expect(items[1].quality).to eq(16)
    end
  end
end
