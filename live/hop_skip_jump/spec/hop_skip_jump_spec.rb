require './lib/hop_skip_jump.rb'

RSpec.describe '#landing' do 

  it 'test1' do 
    arr_1 = [5, 9 ,14]
    arr_2 = [6, 12, 22]
    arr_3 = [8, 4, 2]
    data = [arr_1, arr_2, arr_3]
    expect(landing(data)).to eq(12)
  end
  
  it 'test2' do
    arr1 = [1, 2, 3, 4, 5]
    arr2 = arr1.map {|n| n + 10}
    arr3 = arr2.map {|n| n + 10}
    arr4 = arr3.map {|n| n + 10}
    data = [arr1, arr2, arr3, arr4]

    expect(landing(data)).to eq(14)
  end

  it 'non-square matrix' do
    arr1 = [1, 2, 3]
    arr2 = [4, 5, 6]
    data = [arr1, arr2]

    expect(landing(data)).to eq(3)
  end
  
  it 'non-square matrix (vertical)' do 
    arr1 = [1, 2]
    arr2 = [3, 4]
    arr3 = [4, 5]
    data = [arr1, arr2, arr3]
    expect(landing(data)).to eq(4)
  end

end