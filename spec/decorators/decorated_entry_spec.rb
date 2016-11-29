require 'rails_helper'

describe DecoratedEntry do

  before :each do
  	@offer = double()
  	@position = double()
  	@entry = double()
  	@event1 = double()
  	@event2 = double()

  	@decorated_entry = DecoratedEntry.new(@entry)
  end


  it 'returns nil for a non-existent offer' do
	allow(@entry).to receive(:offer) { nil }
    expect(@decorated_entry.offer).to eq(nil)
  end

  it 'returns offer object for an existing offer' do
  	allow(@entry).to receive(:offer) { @offer }
    expect(@decorated_entry.offer).to be_a(DecoratedOffer)
  end

  it 'returns nil for a non-existent position' do
  	allow(@entry).to receive(:position) { nil }
    expect(@decorated_entry.position).to eq(nil)
  end

  it 'returns position object for an existing position' do
  	allow(@entry).to receive(:position) { @position }
    expect(@decorated_entry.position).to be_a(DecoratedPosition)
  end

  it 'returns a collection of associated events as decorated events' do
    allow(@entry).to receive(:events_history) { [@event1, @event2] }
    expect(@decorated_entry.events_history[0]).to be_a(DecoratedEvent)
  end

end