class Sum

  def calculate(numbers)
    result = 0
    index = 0

    while index < numbers.size
     result += numbers[index]
     index += 1
    end
    result
  end

end