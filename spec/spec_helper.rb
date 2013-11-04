gem 'rspec'
Dir['./lib/*.rb'].each {|file| require file }

def fake_user_pool(size)
  UserPool.new(File.readlines('spec/first_test.txt'), File.readlines('spec/last_test.txt'), size)
end