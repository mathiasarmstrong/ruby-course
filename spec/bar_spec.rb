require 'pry-debugger'
require "./bar.rb"


describe Bar do

  before do
    @bar = Bar.new "The Irish Yodel"
  end

  it "initializes with a name" do
    expect(@bar.name).to eq("The Irish Yodel")
  end

  it "cannot change its name" do
    # That would require a lengthy marketing meeting
    expect {
      @bar.name = 'lolcat cave'
    }.to raise_error
  end

  it "initializes with an empty menu" do
    expect(@bar.menu_items.count).to eq(0)
  end

  it "can add menu items" do
    @bar.add_menu_item('Cosmo', 5.40)
    @bar.add_menu_item('Salty Dog', 7.80)

    expect(@bar.menu_items.count).to eq(2)
  end

  it "can retrieve menu items" do
    @bar.add_menu_item('Little Johnny', 9.95)
    item = @bar.menu_items.first
    expect(item.name).to eq 'Little Johnny'
    expect(item.price).to eq 9.95
  end

  it "has a default happy hour discount of zero" do
    expect(@bar.happy_discount).to eq 0
  end

  it "can set its happy hour discount" do
    expect { @bar.happy_discount = 0.5 }.to_not raise_error
  end

  it "only returns a discount when it's happy hour" do
    Time.stub(:now).and_return(Time.new(2014,5,3,15,30))
    @bar.happy_discount = 0.5
    # HINT: You need to write your own getter

    # We are STUBBING `happy_hour?` to return a specified value.
    # Because of this, you don't have to write a happy_hour? method (yet)
    expect(@bar).to receive(:happy_hour?).and_return(false)
    expect(@bar.happy_discount).to eq 0

    expect(@bar).to receive(:happy_hour?).and_return(true)
    expect(@bar.happy_discount).to eq 0.5

    # Take 2
    @bar.happy_discount = 0.3
    expect(@bar).to receive(:happy_hour?).and_return(false)
    expect(@bar.happy_discount).to eq 0

    expect(@bar).to receive(:happy_hour?).and_return(true)
    expect(@bar.happy_discount).to eq 0.3
  end

  it "constrains its happy hour discount to between zero and one" do
    expect(@bar).to receive(:happy_hour?).twice.and_return(true)

    # HINT: You need to write your own setter
    @bar.happy_discount = 2
    expect(@bar.happy_discount).to eq 1

    @bar.happy_discount = -3
    expect(@bar.happy_discount).to eq 0
  end

# # # # # # # # # # # # # # # # # # # # # #
  # DO NOT CHANGE SPECS ABOVE THIS LINE #
# # # # # # # # # # # # # # # # # # # # # #

  describe '#happy_hour?', :pending => false do
    it "knows when it is happy hour (3:00pm to 4:00pm)" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,5,15,30))
      expect(@bar.happy_hour?).to eq(true)
    end

    it "is not happy hour otherwise" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,5,17,30))
      expect(@bar.happy_hour?).to eq(false)
    end
  end

  context "During normal hours" do
    # TODO: WRITE TESTS TO ENSURE BAR KNOWS NOT TO DISCOUNT
    it "knows not to give a discount before happy hour (8:00am to 2:59pm)" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,5,8,30))
      @bar.happy_discount=1
      expect(@bar.happy_discount).to eq(0)

    end

    it "knows not to give a discount after happy hour 4:01pm to 1:00am" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,5,16,30))
      @bar.happy_discount=1
      expect(@bar.happy_discount).to eq(0)

      @bar.add_menu_item('Cosmo', 5.40)
      @bar.add_menu_item('Salty Dog', 7.80)
      @bar.happy_discount= 0.5
      expect(@bar.menu_items[0].price).to eq(5.4)
    end
  end


  context "During happy hour (3:00pm to 4:00pm)" do
    # TODO: WRITE TESTS TO ENSURE BAR DISCOUNTS DURING HAPPY HOUR
      it "knows to give a discount during" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,5,15,30))
      @bar.add_menu_item('Cosmo', 5.40)
      @bar.add_menu_item('Salty Dog', 7.80)
      @bar.happy_discount= 0.5
      expect(@bar.menu_items[0].price).to eq(5.4*0.75)
    end
  end
  context "During slow days" do
    # TODO: WRITE TESTS TO ENSURE BAR DISCOUNTS DURING HAPPY HOUR
      it "knows to give a 50% discount" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,3,15,30))
      @bar.add_menu_item('Cosmo', 5.40)
      @bar.add_menu_item('Salty Dog', 7.80)
      @bar.happy_discount= 0.5
      expect(@bar.menu_items[0].price).to eq(5.4/2)
    end
    it "but a 25% discount every other day" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,5,15,30))
      @bar.add_menu_item('Cosmo', 5.40)
      @bar.add_menu_item('Salty Dog', 7.80)
      @bar.happy_discount= 0.5
      expect(@bar.menu_items[0].price).to eq(5.4 *0.75)
    end
  end

    context "at any time" do
      it "we can specify that a drink does not get a discount" do

      @bar.add_menu_item('Cosmo', 5.40)
      @bar.add_menu_item('Salty Dog', 7.80)
      @bar.happy_discount= 0.5
      @bar.remove_discount('Cosmo')
      expect(@bar.menu_items[0].price).to eq(5.40)


    end
     it "and we can add a discount too" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,5,15,30))
      @bar.add_menu_item('Cosmo', 5.40)
      @bar.add_menu_item('Salty Dog', 7.80)
      @bar.happy_discount= 0.5
      @bar.remove_discount('Cosmo')
      expect(@bar.menu_items[0].price).to eq(5.40)
      @bar.add_discount('Cosmo')
      expect(@bar.menu_items[0].price).to eq(5.4 *0.75)
    end
    it "we can sell an item" do
      # TODO: CONTROL TIME
      Time.stub(:now).and_return(Time.new(2014,5,5,15,30))
      @bar.add_menu_item('Cosmo', 5.40)
      @bar.add_menu_item('Salty Dog', 7.80)
      @bar.happy_discount= 0.5
      @bar.item_purchase('Cosmo')
      @bar.item_purchase('Cosmo')
      expect(@bar.print_popular_items).to eq("#1 : Cosmo \n")
      @bar.item_purchase('Salty Dog')
      expect(@bar.print_popular_items).to be_a(String)
    end
  end
end
