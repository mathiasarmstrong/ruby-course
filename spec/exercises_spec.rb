require 'rubygems'
require'pry-debugger'
require_relative '../exercises.rb'

describe Exercises  do
  describe '.ex0' do
    context "str is not wishes" do
      it "triples the string str" do
        res =Exercises.ex0('hi')
        expect(res).to eq("hihihi")
      end
    end

    context "sring is wishes" do
      it "returns nope id str is wishes" do
        res = Exercises.ex0('wishes')
        expect(res).to eq("nope")
      end
    end
  end

  describe 'ex1' do
    context "array with no elements" do
      it "returns 0" do
        x=Exercises.ex1([])
        expect(x).to eq(0)
      end
    end
    context "array has several elements" do
      it "returns the number of elemnts in an array" do
        x=Exercises.ex1([1,2,["friends","girls"],{"dog"=>2},"this is interesting"])
        expect(x).to eq(5)
      end
    end
  end

  describe 'ex2' do
    context 'recieves an array that has no elements' do
      it 'returns nil' do
        x=Exercises.ex2([])
        expect(x).to be_nil
      end
    end
    context 'recieves an array that has only 1 element' do
      it 'returns nil' do
        x=Exercises.ex2([['truck']])
        expect(x).to be_nil
      end
    end
    context "recieves an array that has several elements" do
      it "returns the second element of the array" do
        x=Exercises.ex2([1,["friends","girls"],{"dog"=>2},"this is interesting"])
        expect(x).to eq(["friends","girls"])
      end
    end
  end

  describe 'ex3' do
    context 'recieves an array with no elements'do
      it 'returns nil' do
        x = Exercises.ex3([])
        expect(x).to be_nil
      end
    end

    context 'recieves an array with non-number elements'do
      it 'returns string "there are non-number elements!"' do
        x = Exercises.ex3([1,2,3,4,"hello"])
        expect(x).to eq("There are non-number elements!")
      end
    end
    context 'recieves an array 1 number element'do
      it 'returns that number"' do
        x = Exercises.ex3([2])
        expect(x).to eq(2)
      end
    end
    context 'recieves an array many number elements'do
      it 'returns the sum of the numbers in the array"' do
        x = Exercises.ex3([5,2,6,7,11])
        expect(x).to eq(31)
      end
    end
  end

  describe 'ex4' do
    context 'recieves empty array'do
      it 'returns nil'do
        x = Exercises.ex4([])
        expect(x).to be_nil
      end
    end
    context 'recieves an array with 1 element'do
      it 'returns that element if it is a number'do
        x = Exercises.ex4([1])
        expect(x).to eq(1)
      end
      it 'returns a string saying that it was not a number'do
        x = Exercises.ex4(["this is not a number"])
        expect(x).to eq("There was not a number in the array")
      end
    end
    context 'recieves an array with several elements'do
      it 'returns the largest number element'do
        x = Exercises.ex4([1,2,4,12])
        expect(x).to eq(12)
      end
      it 'returns a string saying that there were no numbers'do
        x = Exercises.ex4(["this is not a number"])
        expect(x).to eq("There was not a number in the array")
      end
    end
  end

  describe 'ex5' do
    context 'recieves empty array'do
      it 'returns nil'do
        x = Exercises.ex5([])
        expect(x).to be_nil
      end
    end
    context 'recieves array with one element'do
      it 'puts that element to the screen'do
        Exercises.should_receive(:puts).with(5)
        Exercises.ex5([5])
      end
    end
    context 'recieves array with multiple elements' do
      before do
      $stdout = StringIO.new
      end

      after(:all) do
      $stdout = STDOUT
      end

      it "puts each element" do
      Exercises.ex5([1,2,3,4])
      expect($stdout.string).to match("1\n2\n3\n4\n")
      end
    end
  end
  describe "ex6" do
    context "recieves an array whose last item is not panda" do
      it "changes the last element of the array to panda" do
        test=Exercises.ex6(["this",4,"is",true])
        expect(test[-1]).to eq("panda")
      end
    end
    context "recieves an array whose last item is panda" do
      it "changes the last element of the array to Godzilla" do
        test=Exercises.ex6(["this",4,"is","panda"])
        expect(test[-1]).to eq("GODZILLA")
      end
    end
  end
  describe "ex7" do
    context "recieves an array that contains a 'str'" do
      it "adds 'str' to the end of the array" do
        str='this'
        test=Exercises.ex7(["this",str,"is",true], str)
        expect(test[-1]).to eq(str)
      end
    end
    context "recieves an array that does not contain 'str'" do
      it "does not change the array" do
        str = 'green'
        test=Exercises.ex7(["this",4,"is","panda"],str)
        expect(test[-1]).to eq("panda")
      end
    end
  end
  describe "ex8" do
    context "recieves an array with 1 hash" do
      before do
        $stdout = StringIO.new
      end
      after(:all) do
        $stdout = STDOUT
      end
      it "prints the name and occupation of each person" do
        str=[{ :name => 'Bob', :occupation => 'Builder' }]

        Exercises.ex8(str)
        expect($stdout.string).to match("Bob the Builder\n")
      end
    end

    context "recieves an array with multiple hashes" do
      before do
        $stdout = StringIO.new
      end
      after(:all) do
        $stdout = STDOUT
      end
      it "prints all the names and occupations" do
        str=[{ :name => 'Bob', :occupation => 'Builder' }, {name: 'Jered', occupation: 'programmer'}]
        Exercises.ex8(str)
        expect($stdout.string).to match("Bob the Builder\nJered the programmer\n")
      end
    end
  end


  describe 'ex9' do
    context 'it is not a leap year' do
      it 'returns false' do
        Time.stub(:now).and_return(Time.new(2011))
        test = Exercises.ex9(Time.now)
        expect(test).to be_false
      end
    end
    context 'it is a leap year' do
      it 'returns true' do
        Time.stub(:now).and_return(Time.new(2004))
        test = Exercises.ex9(Time.now)
        expect(test).to be_true
      end
    end
  end
end


describe 'RPS' do
  describe '#initialize' do
    context 'recieves two strings to initialize gameplay' do
      it "has 2 players with a win count of zero" do
        test = RPS.new("tom", "Jerry")
          expect(test.people["tom"]).to eq(0)
          expect(test.people["Jerry"]).to eq(0)
          expect(test.person1).to eq("tom")
          expect(test.person2).to eq("Jerry")
      end
    end
  end
  describe '#play' do
    context 'Game is active' do
      it 'recieves 2 strings and determines the winner' do
        test = RPS.new("tom", "Jerry")
        test.play("r","p")
        expect(test.people["Jerry"]).to eq(1)
      end
    end
  end
end

