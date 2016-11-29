require 'rails_helper'

describe DecoratedPosition do

  # before :each do
  #   @entry = double()
  #   @decorated_entry = DecoratedEntry.new(@entry)
  # end

  before :each do
    @position = double()
    @decorated_position = DecoratedPosition.new(@position)
  end

  # it 'returns nil for a non-existent offer' do
  #   @offer = double()
  # allow(@entry).to receive(:offer) { nil }
  #   expect(@decorated_entry.offer).to eq(nil)
  # end

  # it 'returns offer object for an existing offer' do
  #   @offer = double()
  #   allow(@entry).to receive(:offer) { @offer }
  #   expect(@decorated_entry.offer).to be_a(DecoratedOffer)
  # end

  # it 'returns nil for a non-existent position' do
  #   @position = double()
  #   allow(@entry).to receive(:position) { nil }
  #   expect(@decorated_entry.position).to eq(nil)
  # end

  # it 'returns position object for an existing position' do
  #   @position = double()
  #   allow(@entry).to receive(:position) { @position }
  #   expect(@decorated_entry.position).to be_a(DecoratedPosition)
  # end

  # it 'returns a collection of associated events as decorated events' do
  #   @event1 = double()
  #   @event2 = double()
  #   allow(@entry).to receive(:events_history) { [@event1, @event2] }
  #   expect(@decorated_entry.events_history[0]).to be_a(DecoratedEvent)
  # end

  it 'formats position salary amount' do
    allow(@position).to receive_message_chain(:salary, :amount) { 25 }
    expect(@decorated_position.formatted_amount).to eq('$25')
  end

  it 'formats position acceptance time' do
    time = Time.zone.now
    allow(@position).to receive(:created_at) { time }
    expect(@decorated_position.formatted_acceptance_time).to eq('less than a minute')
  end

  # it 'returns correct remote message' do
  # 	#
  # end

end