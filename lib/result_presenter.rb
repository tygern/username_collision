class ResultPresenter
  def start(category)
    puts '-' * 80
    puts category.center(80)
    puts '-' * 80
  end

  def log(letter, number_of_people, probability_to_collide)
    puts "#{letter} - people: #{number_of_people}"
    puts "    probability: #{probability_to_collide}"
    puts '-' * 80
  end
end