class UserPool
  def initialize(first_names, last_names, total_people)
    @first_names = first_names
    @last_names = last_names
    @total_people = total_people
    @last_name_frequencies = {}
    @first_name_frequencies = {}
  end

  def people_with_name(letter, last_name)
    (first_letter_frequency(letter) * last_name_frequency(last_name) * total_people).to_i
  end

  private

  attr_accessor :first_names, :last_names, :total_people

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
end