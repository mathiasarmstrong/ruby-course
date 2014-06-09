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
    context 'recieves array with multiple elements'do
      xit 'puts that element to the screen'do
        Exercises.should_receive(:puts).with(5)
        Exercises.ex5([5, 4])
      end
    end
  end




  describe 'RPS' do
    context 'recieves two strings to initialize gameplay' do
      it "has 2 players with a win count of zero" do
        test = RPS.new("tom", "Jerry")
          expect(test.people[:tom]).to eq(0)
          expect(test.people[:Jerry]).to eq(0)
      end
    end

  end




end
