require 'time' # you're gonna need it

class Bar
 attr_reader :name, :menu_items, :popular_items
  def initialize(name)
    @name=name
    @menu_items=[]
    @happy_discount=0
    @popular_items={}
  end

  def add_menu_item(name, price, discount=@happy_discount, gets_discount=true)
    menu_items<<Item.new(name,price, discount, gets_discount)
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

  def remove_discount(name)
    item= menu_items.select{|arg| arg.name == name}
   item.length!=0 ? item[0].take_off_discount : nil
  end
  def add_discount(name)
    item= menu_items.select{|arg| arg.name == name}
   item.length!=0 ? item[0].give_discount : nil
  end
  def happy_hour?
    Time.now.hour==15
  end
  def item_purchase(name)
    # binding.pry
    @popular_items[name]||=0
    @popular_items[name]+=1
  end
  def print_popular_items
    if @popular_items.length >= 1
      food = @popular_items.sort_by{|key, value| value}
      list=""
      food.each_with_index{|pop, index| index<=4 ? list=list+"##{index+1} : #{pop[0]} \n" : nil }
      return list
    else
      return "There is no food available"
    end
  end
end


class Item
  attr_reader :name, :gets_discount
  attr_accessor :discount
  def initialize(name, price, discount, gets_discount)
    @name=name
    @price=price
    @gets_discount=gets_discount
  end
  def price
    Time.now.hour==15 && @gets_discount ? @price*@discount : @price
  end
  def take_off_discount
    @gets_discount=false
  end
  def give_discount
    @gets_discount=true
  end

end
