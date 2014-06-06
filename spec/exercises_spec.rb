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
    context 'array has no elements' do
      it 'returns nil' do
        x=Exercises.ex2([])
        expect(x).to be_nil
      end
    end
    context 'array has only 1 element' do
      it 'returns nil' do
        x=Exercises.ex2([['truck']])
        expect(x).to be_nil
      end
    end
    context "array has several elements" do
      it "returns the second element of the array" do
        x=Exercises.ex2([1,["friends","girls"],{"dog"=>2},"this is interesting"])
        expect(x).to eq(["friends","girls"])
      end
    end
  end

  describe 'ex3' do
    context 'array with no elements'do
      it 'returns nil' do
        x = Exercises.ex3([])
        expect(x).to be_nil
      end
    end

    context 'array with non-number elements'do
      it 'returns string "there are non-number elements!"' do
        x = Exercises.ex3([1,2,3,4,"hello"])
        expect(x).to eq("There are non-number elements!")
      end
    end
    context 'array 1 number element'do
      it 'returns that number"' do
        x = Exercises.ex3([2])
        expect(x).to eq(2)
      end
    end
    context 'array many number elements'do
      it 'returns the sum of the numbers in the array"' do
        x = Exercises.ex3([5,2,6,7,11])
        expect(x).to eq(31)
      end
    end
  end


end
