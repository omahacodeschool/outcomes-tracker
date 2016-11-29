require 'spec_helper'

describe DecoratedEntry do
  let(:decorated_entry) { FactoryGirl.build_stubbed(:decorated_entry) }

  it 'returns a collection of associated events as decorated events' do
    expect(decorated_entry.events_history).to eq('600')
  end

end