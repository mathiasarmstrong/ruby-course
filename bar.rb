require 'time' # you're gonna need it

class Bar
 attr_reader :name, :menu_items
  def initialize(name)
    @name=name
    @menu_items=[]
    @happy_discount=0
  end

  def add_menu_item(name, price, discount=@happy_discount)
    menu_items<<Item.new(name,price, discount)
  end

  def happy_discount
    self.happy_hour? ? (return @happy_discount) : (return 0)
  end

  def happy_discount=(amount= 0.50)
    Time.now.day==1||Time.now.day==3 ? nil : (amount = amount/2)
    if amount<=1.0
      if amount>=0
        if @menu_items.length>0
          @menu_items.each{|arg| arg.discount =(1-amount)}
        end
        @happy_discount=amount
      else
        @happy_discount=0
      end
    else
      @happy_discount=1
    end
  end

  def happy_hour?
    Time.now.hour==15
  end
end


class Item
  attr_reader :name
  attr_accessor :discount
  def initialize(name, price, discount)
    @name=name
    @price=price
  end
  def price
    Time.now.hour==15 ? @price*@discount : @price
  end

end
