class Collisions
  def initialize(first_names, last_names, total_people, additional_identifiers)
    @first_names = first_names
    @last_names = last_names
    @total_people = total_people
    @additional_identifiers = additional_identifiers.to_f
    @last_name_frequencies = {}
    @first_name_frequencies = {}
    @divider = '-' * 80
  end

  def print_probabilities_for(last_name)
    puts @divider
    puts last_name.center(80)
    puts @divider

    ('A'..'Z').each do |letter|
      number_of_people = people_with_name(letter, last_name)
      probability_to_collide = collision_probability(number_of_people, additional_identifiers)

      puts "#{letter} - people: #{number_of_people}"
      puts "    probability: #{probability_to_collide}"
      puts @divider
    end
  end

  private

  attr_accessor :first_names, :last_names, :total_people, :additional_identifiers

  def people_with_name(letter, last_name)
    (first_letter_frequency(letter) * last_name_frequency(last_name) * total_people).to_i
  end

  def first_letter_frequency(first_letter)
    @first_name_frequencies[first_letter] ||= calculate_frequency(first_letter, first_names, false)
  end

  def last_name_frequency(last_name)
    @last_name_frequencies[last_name] ||= calculate_frequency(last_name, last_names, true)
  end

  def calculate_frequency(criteria, frequency_list, exact)
    criteria += ' ' if exact
    percentage = frequency_list.inject(0) do |result, line|
      line.match("^#{criteria}") ? result + (line[15..19].to_f) : result
    end
    percentage / 100
  end

  def collision_probability(people, choices)
    avoid = (0...people).inject(1) { |result, i| result * (choices - i)/choices }
    1 - avoid
  end
end

collisions = Collisions.new(File.readlines('dist.all.first.txt'), File.readlines('dist.all.last.txt'), 50000, 365 * 10000)
collisions.print_probabilities_for("JOHNSON")