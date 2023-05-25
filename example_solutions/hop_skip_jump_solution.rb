def landing(data)
  data_length = data.flatten.length
  # First, flatten the data into a single array in a spiral pattern
  
  unraveled = []
  until unraveled.flatten.length == data_length
    unraveled << data.map(&:shift)
    unraveled << data.pop 
    unraveled << data.map(&:pop).reverse
    unraveled << (data.shift || []).reverse
  end

  # Flatten to get rid of nested arrays. Since she skips every OTHER number,
  # she lands on the last even index of the new array.
  data_length.even? ? unraveled.flatten[-2] : unraveled.flatten[-1]
end
