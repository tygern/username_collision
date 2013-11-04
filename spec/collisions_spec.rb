require 'spec_helper'

describe Collisions do
  let(:user_pool) { fake_user_pool(10000) }
  let(:result_presenter) { double(start: nil, log: nil)}
  let(:collisions) { Collisions.new(user_pool, 365, result_presenter) }

  it 'returns the correct probability' do
    result_presenter.should_receive(:start).with('SMITH')
    result_presenter.should_receive(:log).with('J', 15, 0.2529013197636867)
    collisions.calculate_probabilities_for('SMITH', ['J'])
  end

  it 'iterates through multiple letters' do
    result_presenter.should_receive(:log).with('J', 15, 0.2529013197636867)
    result_presenter.should_receive(:log).with('R',  4, 0.016355912466550326)
    result_presenter.should_receive(:log).with('P',  0, 0.0)
    collisions.calculate_probabilities_for('SMITH', ['J', 'R', 'P'])
  end
end