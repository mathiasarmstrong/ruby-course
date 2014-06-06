require 'rubygems'
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



end
