require 'spec_helper'

describe UserPool do
  let(:user_pool) { fake_user_pool(10000) }

  it 'returns the correct number of people' do
    user_pool.people_with_name('R', 'SMITH').should == 4
    user_pool.people_with_name('J', 'SMITH').should == 15
  end

  it 'returns zero if no matches are found' do
    user_pool.people_with_name('Z', 'SMITH').should == 0
    user_pool.people_with_name('J', 'DOE').should == 0
  end

  it 'looks for an exact match with last names' do
    user_pool.people_with_name('R', 'WILLIAMS').should == 2
  end
end