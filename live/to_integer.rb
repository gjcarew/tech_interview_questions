# This is the shortest code challenge I've received. It took about 15 minutes to complete. 

# Recreate the `.to_i` method to convert a string of a positive integer to an integer type, without using the to_i method. 

# A dictionary is included to get you started, and a test suite. Type `ruby to_integer.rb` to run the test suite.

require 'rspec/autorun'

def lookup(value)
  {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '0' => 0 
  }[value]
end

def to_integer()
# Your code goes here 
end

RSpec.describe '#to_integer' do
  it 'translates a single string of length 1 to an integer' do 
    expect(to_integer('8')).to eq(8)

    expect(to_integer('4')).to eq(4)
  end

  it 'can handle any length integer' do 
    expect(to_integer('75')).to eq(75)

    expect(to_integer('4879')).to eq(4879)
  end
end
