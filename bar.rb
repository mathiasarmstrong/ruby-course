require 'time' # you're gonna need it

class Bar
 attr_reader :name, :menu_items
  def initialize(name)
    @name=name
    @menu_items=[]
    @happy_discount=0
  end

  def add_menu_item(name, price)
    menu_items<<Item.new(name,price)
  end

  def happy_discount
    self.happy_hour? ? (return @happy_discount) : (return 0)
  end
  def happy_discount=(amount)
    if amount<=1
      if amount>=0
        @happy_discount=amount
      else
        @happy_discount=0
      end
    else
      @happy_discount=1
    end
  end
  def happy_hour?
    Time.now.hour==3
  end
end
class Item
  attr_reader :name, :price
  def initialize(name, price)
    @name=name
    @price=price
    [@name,@price]
  end
  def price
    Time.now.hour==15 ? @price/2 : @price
  end
end
