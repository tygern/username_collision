Dir['./lib/*.rb'].each {|file| require file }

user_pool = UserPool.new(File.readlines('./data/dist.all.first.txt'), File.readlines('./data/dist.all.last.txt'), 50000)
collisions = Collisions.new(user_pool, 365 * 10000, ResultPresenter.new)
collisions.calculate_probabilities_for("SMITH")