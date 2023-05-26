class GildedRose
  
  # Making decay rate a class variable so it can easily be updated. 
  # Sell in can be hard coded, since there is no way to skip days to sell in date.
  @@decay_rate = -1

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
        when "Aged Brie"
          decay_sell_in(item)
          decay_quality(item, -@@decay_rate)
        when "Sulfuras, Hand of Ragnaros"
          next
        when "Backstage passes to a TAFKAL80ETC concert"
          update_tickets(item)
        when "Conjured"
          decay_sell_in(item)
          decay_quality(item, 2 * @@decay_rate)
        else
          decay_sell_in(item)
          decay_quality(item, @@decay_rate)
      end

    end
  end

  private

  # Making these separate methods to DRY up the code
  def decay_quality(item, rate)
    if item.sell_in.zero?
      item.quality += 2 * rate
    else
      item.quality += rate
    end

    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.quality < 0
  end

  def decay_sell_in(item)
    item.sell_in -= 1
    item.sell_in = 0 if item.sell_in.negative?
  end

  # Custom rules for tickets, since they are so different
  def update_tickets(item)
    decay_sell_in(item)
    if item.sell_in == 0
      item.quality = 0
    elsif item.sell_in.positive? && item.sell_in <= 5
      decay_quality(item, 3)
    elsif item.sell_in > 5 && item.sell_in <= 10
      decay_quality(item, 2)
    else
      decay_quality(item, -@@decay_rate)
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
