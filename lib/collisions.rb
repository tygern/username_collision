class Collisions
  def initialize(user_pool, additional_identifiers, result_presenter)
    @user_pool = user_pool
    @additional_identifiers = additional_identifiers.to_f
    @result_presenter = result_presenter
  end

  def calculate_probabilities_for(last_name, letters = ('A'..'Z'))
    @result_presenter.start(last_name)

    letters.each do |first_initial|
      number_of_people = @user_pool.people_with_name(first_initial, last_name)
      probability_to_collide = collision_probability(number_of_people)

      @result_presenter.log(first_initial, number_of_people, probability_to_collide)
    end
  end

  private

  def collision_probability(people)
    avoidance_probability = (0...people).inject(1) do |result, i|
      result * (@additional_identifiers - i)/@additional_identifiers
    end
    1 - avoidance_probability
  end
end
