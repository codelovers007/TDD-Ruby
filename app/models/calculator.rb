class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      numbers = parts[1]
    end

    numbers = numbers.gsub("\n", delimiter)
    extracted_data = numbers.split(delimiter).map(&:to_i)

    negatives = extracted_data.select { |num| num < 0 }
    raise "negative numbers not allowed: #{negatives.join(",")}" if negatives.any?

    extracted_data.sum
  end
end
