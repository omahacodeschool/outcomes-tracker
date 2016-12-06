require 'rails_helper'

describe DecoratedEntry do

  before :each do
  	@entry = double()
  	@decorated_entry = DecoratedEntry.new(@entry)
  end

  it 'returns nil for a non-existent job application' do
    @job_application = double()
    allow(@entry).to receive(:job_application) { nil }
    expect(@decorated_entry.job_application).to eq(nil)
  end

  it 'returns job application object for an existing job application' do
    @job_application = double()
    allow(@entry).to receive(:job_application) { @job_application }
    expect(@decorated_entry.job_application).to be_a(DecoratedJobApplication)
  end

  it 'returns nil for a non-existent offer' do
  	@offer = double()
	allow(@entry).to receive(:offer) { nil }
    expect(@decorated_entry.offer).to eq(nil)
  end

  it 'returns offer object for an existing offer' do
  	@offer = double()
  	allow(@entry).to receive(:offer) { @offer }
    expect(@decorated_entry.offer).to be_a(DecoratedOffer)
  end

  it 'returns nil for a non-existent position' do
  	@position = double()
  	allow(@entry).to receive(:position) { nil }
    expect(@decorated_entry.position).to eq(nil)
  end

  it 'returns position object for an existing position' do
  	@position = double()
  	allow(@entry).to receive(:position) { @position }
    expect(@decorated_entry.position).to be_a(DecoratedPosition)
  end

  it 'returns a collection of associated events as decorated events' do
    @event1 = double()
    @event2 = double()
    allow(@entry).to receive(:events_history) { [@event1, @event2] }
    expect(@decorated_entry.events_history[0]).to be_a(DecoratedEvent)
  end

  it 'formats entry created time' do
    allow(@entry).to receive(:created_at) { Time.zone.now }
    expect(@decorated_entry.formatted_created_time).to eq('less than a minute')
  end

end