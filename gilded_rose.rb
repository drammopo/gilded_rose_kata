class GildedRose
  attr_reader :name, :quality, :days_remaining

  def initialize(name, quality, days_remaining)
    @name, @quality, @days_remaining = name, quality, days_remaining
  end

  def tick
    if @name != 'Aged Brie' && @name != 'Backstage passes to a TAFKAL80ETC concert'
      if @quality > 0
        if @name != 'Sulfuras, Hand of Ragnaros'
          @quality -= 1
        end
      end
    else
      if @quality < 50
        @quality += 1
        if @name == 'Backstage passes to a TAFKAL80ETC concert'
          if @days_remaining < 11
            if @quality < 50
              @quality += 1
            end
          end
          if @days_remaining < 6
            if @quality < 50
              @quality += 1
            end
          end
        end
      end
    end
    if @name != 'Sulfuras, Hand of Ragnaros'
      @days_remaining -= 1
    end
    if @days_remaining < 0
      if @name != "Aged Brie"
        if @name != 'Backstage passes to a TAFKAL80ETC concert'
          if @quality > 0
            if @name != 'Sulfuras, Hand of Ragnaros'
              @quality -= 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality += 1
        end
      end
    end

    case name
    when 'normal'
        return normal_tick
    when 'Aged Brie'
      return brie_tick
    end
  end

  def brie_tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0
  end

  def normal_tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
  end
end
